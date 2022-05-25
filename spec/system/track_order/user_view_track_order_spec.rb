require 'rails_helper'

describe 'Usuário visita a tela de Rastreamento' do
  it 'e vễ header Relatório de Rastreamento' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Rastreamento'
    end
    # Assert
    expect(page).to have_content('Rastreamento')
    expect(current_path).to eq track_orders_path
  end

  it 'e vê Historico de Rastreamento' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
        email: 'joana@gmailx.com.br')

    service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'Aprovado', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
     
    t_order_1 = TrackOrder.create!( tracking_date: '2022-05-22', location: 'Araraquara', comments: 'Saiu do depósito de Araraquara', service_order: service_order)

    t_order_2 = TrackOrder.create!( tracking_date: '2022-05-23', location: 'Ribeirão Preto', comments: 'Chegou no depósito de Ribeirão Preto', service_order: service_order)
    # Act
    visit root_path
    within('nav') do
      click_on 'Rastreamento'
    end
    # Assert
    expect(page).to have_content('22-05-22')
    expect(page).to have_content('Araraquara')
    expect(page).to have_content('Saiu do depósito de Araraquara')
    expect(page).to have_content(service_order.tracking_id)
    
    expect(page).to have_content('22-05-23')
    expect(page).to have_content('Ribeirão Preto')
    expect(page).to have_content('Chegou no depósito de Ribeirão Preto')
    expect(page).to have_content(service_order.tracking_id)
  end

  it 'não existe Histórico de Rastreamento' do
    # Arrange
    # Act
    visit root_path
    click_on 'Rastreamento'

    # Assert
    expect(page).to have_content 'Não há histórico de rastreio'
  end
end