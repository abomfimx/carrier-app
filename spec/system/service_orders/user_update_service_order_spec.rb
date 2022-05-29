require 'rails_helper'

describe 'Usuário informa nova situação do pedido' do
  it 'e pedido foi entregue' do
    # Arrange
 # Arrange
  carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
    domain_name: 'xpto.com.br', active_state: false, 
    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

  claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
  carrier: carrier)

  product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
    sku: 'CEL-J11CEL-XYZ7499')

  warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
      address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

  vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
      year: '2021', max_load: 15_800, carrier: carrier)

  customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
      state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

  s_order = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier, status: 'approved',
    customer: customer, warehouse: warehouse, vehicule: vehicule, 
    product: product)

  # Act 
  login_as(claudia)
  visit root_path
  click_on 'Ordem de Serviço'
  click_on s_order.tracking_id
  click_on 'Pedido Entregue'

  # Assert
  expect(current_path).to eq service_order_path(s_order.id)
  expect(page).to have_content('Entregue')
  end

  it 'e pedido foi recusado' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')
  
    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
    carrier: carrier)
  
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
      sku: 'CEL-J11CEL-XYZ7499')
  
    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
        address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
  
    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
        year: '2021', max_load: 15_800, carrier: carrier)
  
    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
        state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')
  
    s_order = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier, 
      customer: customer, warehouse: warehouse, vehicule: vehicule, 
      product: product)
  
    # Act 
    login_as(claudia)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on s_order.tracking_id
    click_on 'Pedido Recusado'
  
    # Assert
    expect(current_path).to eq service_order_path(s_order.id)
    expect(page).to have_content('Recusado')
  end

  it 'e pedido foi aprovado' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')
  
    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
    carrier: carrier)
  
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
      sku: 'CEL-J11CEL-XYZ7499')
  
    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
        address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
  
    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
        year: '2021', max_load: 15_800, carrier: carrier)
  
    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
        state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')
  
    s_order = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier, 
      customer: customer, warehouse: warehouse, vehicule: vehicule, 
      product: product)
  
    # Act 
    login_as(claudia)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on s_order.tracking_id
    click_on 'Pedido Aprovado'
  
    # Assert
    expect(current_path).to eq service_order_path(s_order.id)
    expect(page).to have_content('Aprovado')
  end
end