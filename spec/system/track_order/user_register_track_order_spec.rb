require 'rails_helper'

describe 'Usuário cadastra um Registro de Rastreio' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Rastreamento'
    end
    click_on 'Novo Registro'

    # Assert
    expect(page).to have_content('Novo Registro de Rastreio')
    expect(page).to have_content('Data')
    expect(page).to have_content('Localização')
    expect(page).to have_content('Comentários')
    expect(page).to have_content('Código de Rastreio')
  end

  it 'com sucesso' do
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
     

    # Act
    visit root_path
    within('nav') do
      click_on 'Rastreamento'
    end
    click_on 'Novo Registro'
    fill_in 'Data', with: '2022-05-21'
    fill_in 'Localização', with: 'Araraquara'
    fill_in 'Comentários', with: 'Deixou o depósito de Araraquara'
    select service_order.tracking_id, from: 'Código de Rastreio'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Rastreio cadastrado com sucesso')
    expect(page).to have_content('2022-05-21')
    expect(page).to have_content('Araraquara')
    expect(page).to have_content('Deixou o depósito de Araraquara')
    expect(page).to have_content(service_order.tracking_id)
  end

  it 'com dados incompletos' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')
    product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
        email: 'joana@gmailx.com.br')

    service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'Aprovado', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
     
    # Act
    visit root_path
    within('nav') do
      click_on 'Rastreamento'
    end
    click_on 'Novo Registro'
    fill_in 'Data', with: ''
    fill_in 'Localização', with: ''
    fill_in 'Comentários', with: ''
    select service_order.tracking_id, from: 'Código de Rastreio'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Rastreio não cadastrado')
    expect(page).to have_content('Data não pode ficar em branco')
    expect(page).to have_content('Localização não pode ficar em branco')
    expect(page).to have_content('Comentários não pode ficar em branco')

  end
end
