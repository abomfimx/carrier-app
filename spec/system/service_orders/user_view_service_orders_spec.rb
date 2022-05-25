require 'rails_helper'

describe 'Usuário visita a tela de Ordem de Serviço' do
  it 'e vê header Lista de Ordens de Serviço' do 
    # Arrange 
    # Act
    visit root_path
    within('nav') do
      click_on 'Ordem de Serviço'
    end
  end

  it 'e vê as OS cadastradas' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                              registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                              state: 'SP')
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                                email: 'joana@gmailx.com.br')

    s_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

    # Act 
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'

    # Assert
    expect(page).not_to have_content('Não existe Ordem de Serviço cadastrada')
    expect(page).to have_content('Data da OS')
    expect(page).to have_content('Código de Rastreio')
    expect(page).to have_content('Situação da Ordem')
    expect(page).to have_content('Distância')
    expect(page).to have_content('Transportadora')
    expect(page).to have_content('Cliente')
    expect(page).to have_content('Depósito')
    expect(page).to have_content('Veículo')
    expect(page).to have_content('Produto')

    expect(page).to have_content('2022-05-21')
    expect(page).to have_content('Pendente')
    expect(page).to have_content(s_order.tracking_id)
    # expect(page).to have_content('XXXX-YYYYY-ZZZZ')
    expect(page).to have_content('110')
    expect(page).to have_content('XPTO Trans')
    expect(page).to have_content('Joana da Silva')
    expect(page).to have_content('AQA')
    expect(page).to have_content('ASD4493')
    expect(page).to have_content('Samsung J11')
 

  end

  it 'e não existe Ordem de Serviço cadastradas' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    # Act
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'
    # Assert
    expect(page).to have_content('Não existe Ordem de Serviço cadastrada')
  end
end