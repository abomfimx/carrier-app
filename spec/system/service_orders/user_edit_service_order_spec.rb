require 'rails_helper'

describe 'Usuário edita uma Orderm de Serviço' do
  it 'e deve estar autenticado' do
    carrier1 = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
    carrier: carrier1)

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
    visit service_order_path(s_order1.id)

    # Arrange
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
  # Arrange

    carrier1 = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', 
    domain_name: 'acme.com.br', active_state: false, 
    registration_number: '66800929000103', address: 'Av. Brasil, 95', 
    city: 'Goiania', state: 'GO') 

    carrier2 = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    claudia = User.create!(name: 'Claudia', email: 'claudia@sistemadefrete.com.br', password: 'password', 
    carrier: carrier2)

    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, 
      sku: 'CEL-J11CEL-XYZ7499')

    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', 
        address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    warehouse2 =Warehouse.create!(name: 'Depósito Regional Interior - 6', city: 'Ribeirao Preto', 
          address: 'Avenida Marginal, 1000', state: 'SP', code: 'RAO')    
  
    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R',
        year: '2021', max_load: 15_800, carrier: carrier1)
  
    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', 
        state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

    s_order = ServiceOrder.create!(placed_date: '21-05-2022', distance:300, carrier: carrier2, 
      customer: customer, warehouse: warehouse, vehicule: vehicule, status: 'rejected',
      product: product)

    # Act 
    login_as(claudia)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on s_order.tracking_id
    click_on 'Editar'

    fill_in 'Data da OS', with: '2022-05-27'
    expect(page).to have_field('Código de Rastreio', with: s_order.tracking_id)
    fill_in 'Distância', with: '200'
    select 'XPTO Trans', from: 'Transportadora'
    select 'Joana da Silva', from: 'Cliente'
    # select 'approved', from: 'Situação da Ordem'
    select 'RAO', from: 'Depósito'
    # select 'ASD4493', from: 'Veículo'
    select 'Samsung J11', from: 'Produto'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Ordem de Serviço atualizada com sucesso'
    expect(page).to have_content 'XPTO Trans'
    expect(page).to have_content '27/05/2022'
    expect(page).to have_content 'RAO'
  end

  it 'caso seja o responsável' do
    carrier1 = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',
      domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
    carrier: carrier1)

    carrier2 = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', 
      domain_name: 'acme.com.br', active_state: false, 
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
    visit edit_service_order_path(s_order1.id)

    # Arrange
    expect(current_path).to eq root_path
  end

  # it 'e mantém os campos obrigatórios' do
  #   # Arrange
  #   carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
  #     registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
  #     state: 'SP')
    
  #   claudia = User.create!(name: 'Claudia', email: 'claudia@xpto.com.br', password: 'password', 
  #                         carrier: carrier)

  #   product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

  #   warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

  #   vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

  #   customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
  #   email: 'joana@gmailx.com.br')

  #  s_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicule, product: product)


  #   # Act 
  #   login_as(claudia)
  #   visit root_path
  #   click_on 'Ordem de Serviço'
  #   click_on s_order.tracking_id
  #   fill_in 'Data da OS', with: ''
  #   fill_in 'Código de Rastreio', with: 's_order.tracking_id'
  #   fill_in 'Distância', with: ''
  #   select 'XPTO Trans', from: 'Transportadora'
  #   select 'Joana da Silva', from: 'Cliente'
  #   select 'AQA', from: 'Depósito'
  #   select 'ASD4493', from: 'Veículo'
  #   select 'Samsung J11', from: 'Produto'
  #   click_on 'Salvar'

  #   # Assert
  #   expect(page).to have_content('Não foi possível atualizar a Ordem de Serviço')
  #   expect(page).to have_content('Data da OS não pode ficar em branco')
  #   expect(page).to have_content('Distância não pode ficar em branco')
  # end
end
