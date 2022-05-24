require 'rails_helper'

describe 'Usuário cadastra uma Ordem de Serviço' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
      within('nav') do
      click_on 'Ordem de Serviço'
    end
    click_on 'Cadastrar Ordem de Serviço'

    # Assert
    expect(page).to have_content('Nova Ordem de Serviço')
    expect(page).to have_content('Data da OS')
    expect(page).to have_content('Código de Rastreio')
    expect(page).to have_content('Situação da Ordem')
    expect(page).to have_content('Distância')
    expect(page).to have_content('Transportadora')
    expect(page).to have_content('Cliente')
    expect(page).to have_content('Depósito')
    expect(page).to have_content('Veículo')
    expect(page).to have_content('Produto')
  end

  it 'com sucesso' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                    state: 'SP')
    Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                     email: 'joana@gmailx.com.br')

    # Act
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Cadastrar Ordem de Serviço'
    fill_in 'Data da OS', with: '2022-05-21'
    fill_in 'Código de Rastreio', with: 'XXXX-YYYYY-ZZZZ'
    fill_in 'Distância', with: '100'
    select 'XPTO Trans', from: 'Transportadora'
    select 'Joana da Silva', from: 'Cliente'
    select 'AQA', from: 'Depósito'
    select 'ASD4493', from: 'Veículo'
    select 'Samsung J11', from: 'Produto'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Ordem de Serviço cadastrada com sucesso')
    expect(page).to have_content('2022-05-21')
    expect(page).to have_content('XXXX-YYYYY-ZZZZ')
    expect(page).to have_content('Pendente')
    expect(page).to have_content('100')
    expect(page).to have_content('XPTO Trans')
    expect(page).to have_content('Joana da Silva')
    expect(page).to have_content('AQA')
    expect(page).to have_content('ASD4493')
    expect(page).to have_content('Samsung J11')
  end

  it 'com dados incompletos' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                              registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                              state: 'SP')
    Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

    Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

    Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

    Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                    email: 'joana@gmailx.com.br')  
    # Act
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Cadastrar Ordem de Serviço'
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
    expect(page).to have_content('Ordem de Serviço não cadastrada')
    expect(page).to have_content('Data da OS não pode ficar em branco')
    expect(page).to have_content('Código de Rastreio não pode ficar em branco')
    expect(page).to have_content('Distância não pode ficar em branco')

  end
end