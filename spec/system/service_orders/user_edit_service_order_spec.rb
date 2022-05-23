require 'rails_helper'

describe 'Usuário edita uma Orderm de Serviço' do
  it 'a partir da Lista de OS' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                              registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                              state: 'SP')
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                    email: 'joana@gmailx.com.br')

    ServiceOrder.create!(placed_date: '2022-05-21', status: 'Pendente', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicule, product: product)

    # Act
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'XXXX-YYYYY-ZZZZ'
 
    # Assert
    expect(page).to have_content 'Alterar Ordem de Serviço'
    expect(page).to have_field('Data da OS', with: '2022-05-21')
    expect(page).to have_field('Código de Rastreio', with: 'XXXX-YYYYY-ZZZZ')
    expect(page).to have_field('Situação da Ordem', with: 'Pendente')
    expect(page).to have_field('Distância', with: 110 )
    expect(page).to have_field('Cliente', with: '1')
    expect(page).to have_content('Cliente Joana da Silva')
    expect(page).to have_field('Depósito', with: '1')
    expect(page).to have_content('Depósito AQA')
    expect(page).to have_field('Veículo', with: '1')
    expect(page).to have_content('Veículo ASD4493')
    expect(page).to have_field('Produto', with: '1')
    expect(page).to have_content('Produto Samsung J11')

  end

  it 'com sucesso' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

     Warehouse.create!(name: 'Depósito Regional Interior - 3', city: 'Ribeirão Preto', address: 'Avenida Saudade, 1000', state: 'SP', code: 'RAO')

    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
    email: 'joana@gmailx.com.br')

    Customer.create!(name: 'José da Silva', address: 'Rua do Curtume, 300', city: 'São Paulo', state: 'SP', cpf:'00846123457', 
      email: 'jose@gmailx.com.br')

    ServiceOrder.create!(placed_date: '2022-05-21', status: 'Pendente', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicule, product: product)

    # Act 
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'XXXX-YYYYY-ZZZZ'
    fill_in 'Data da OS', with: '2022-05-22'
    fill_in 'Código de Rastreio', with: 'XXXX-YYYYY-ZZZZ'
    fill_in 'Distância', with: '200'
    select 'XPTO Trans', from: 'Transportadora'
    select 'José da Silva', from: 'Cliente'
    select 'RAO', from: 'Depósito'
    select 'ASD4493', from: 'Veículo'
    select 'Samsung J11', from: 'Produto'
    click_on 'Salvar'
  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse =Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    vehicule = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
    email: 'joana@gmailx.com.br')

    ServiceOrder.create!(placed_date: '2022-05-21', status: 'Pendente', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicule, product: product)


    # Act 
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'XXXX-YYYYY-ZZZZ'
    fill_in 'Data da OS', with: ''
    fill_in 'Código de Rastreio', with: ''
    fill_in 'Distância', with: ''
    select 'XPTO Trans', from: 'Transportadora'
    select 'Joana da Silva', from: 'Cliente'
    select 'AQA', from: 'Depósito'
    select 'ASD4493', from: 'Veículo'
    select 'Samsung J11', from: 'Produto'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Não foi possível atualizar a Ordem de Serviço')
    expect(page).to have_content('Data da OS não pode ficar em branco')
    expect(page).to have_content('Código de Rastreio não pode ficar em branco')
    expect(page).to have_content('Distância não pode ficar em branco')
  end
end
