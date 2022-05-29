require 'rails_helper'

describe 'Usuário vê seus pedidos' do
  it 'e deve estar autenticado' do
    # Arrange

    # Act
    visit root_path
    click_on 'Ordem de Serviço'

    # Arrange
    expect(current_path).to eq new_user_session_path
  end

  it 'e não ve outros pedidos' do
    # Arrange  
    carrier1 = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
                              domain_name: 'xpto.com.br', active_state: false, 
                              registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
                          carrier: carrier1)

    carrier2 = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', 
                              domain_name: '@acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', 
                              city: 'Goiania', state: 'GO')

    deborah = User.create!(name: 'Deborah', email: 'deborah@acme.com.br', password: 'password', carrier: carrier2)

    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
                              sku: 'CEL-J11CEL-XYZ7499')

    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
                                address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
                          
    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
                                year: '2021', max_load: 15_800, carrier: carrier1)
                          
    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
                                state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

    s_order1 = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier1, 
                              customer: customer, warehouse: warehouse, vehicule: vehicule, 
                              product: product)

    s_order2 = ServiceOrder.create!(placed_date: '21-05-2022', distance: 110, carrier: carrier2, 
                              customer: customer, warehouse: warehouse, vehicule: vehicule, 
                              product: product)

    s_order3 = ServiceOrder.create!(placed_date: '21-05-2022', distance: 110, carrier: carrier1, 
                              customer: customer, warehouse: warehouse, vehicule: vehicule, 
                              product: product)
    # allow(SecureRandom).to receive(:alphanumeric).and_return('XXXX-YYYYY-ZZZZ')
    # Act
    login_as(claudia)

    visit root_path
    click_on 'Ordem de Serviço'
    # Assert
    expect(s_order1).to have_attributes(tracking_id: s_order1.tracking_id)
    expect(s_order1).not_to have_attributes(tracking_id: s_order2.tracking_id)
    expect(s_order3).to have_attributes(tracking_id: s_order3.tracking_id)
    expect(page).to have_content(s_order1.tracking_id)
    expect(page).not_to have_content(s_order2.tracking_id)
    expect(page).to have_content(s_order3.tracking_id)
  end

  it 'e não visita um pedido de outros usuários' do
    # Arrange
    
    carrier1 = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
    carrier: carrier1)

    carrier2 = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', 
      domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', 
      city: 'Goiania', state: 'GO')

    deborah = User.create!(name: 'Deborah', email: 'deborah@acme.com.br', password: 'password', carrier: carrier2)

    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
      sku: 'CEL-J11CEL-XYZ7499')

    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
        address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
  
    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
        year: '2021', max_load: 15_800, carrier: carrier1)
  
    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
        state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

    s_order1 = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier1, 
      customer: customer, warehouse: warehouse, vehicule: vehicule, 
      product: product)


    # allow(SecureRandom).to receive(:alphanumeric).and_return('XXXX-YYYYY-ZZZZ')
    # Act
    login_as(deborah)
    visit service_order_path(s_order1.id)

    # Arrange
    expect(current_path).not_to eq service_order_path(s_order1.id)
    expect(current_path).to eq root_path
    expect(page).to have_content 'Você não possui acesso a esta ordem'
    
  end
end