require 'rails_helper'

describe 'Usuário cadastra um novo veículo' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículos'

    # Assert
    expect(page).to have_content('Novo Veículo')
    expect(page).to have_field('Marca')
    expect(page).to have_field('Modelo')
    expect(page).to have_field('Ano')
    expect(page).to have_field('Placa')
    expect(page).to have_field('Carga Máxima')
  end

  it 'com sucesso' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículos'
    fill_in 'Marca', with: 'Ford'
    fill_in 'Modelo', with: 'Ford Cargo 1000'
    fill_in 'Placa', with: 'AX4DRF'
    fill_in 'Ano', with: '2010'
    fill_in 'Carga Máxima', with: '5000'
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Veículo cadastrado com sucesso')
    expect(page).to have_content('Ford')
    expect(page).to have_content('Ford Cargo 1000')
    expect(page).to have_content('AX4DRF')
    expect(page).to have_content('2010')
    expect(page).to have_content('5000')
    expect(page).to have_content('ACME LOG')
  end

  it 'com dados incompletos' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículos'
    fill_in 'Marca', with: 'Ford'
    fill_in 'Modelo', with: 'Ford Cargo 1000'
    fill_in 'Placa', with: ''
    fill_in 'Ano', with: '2010'
    fill_in 'Carga Máxima', with: ''
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Veículo não cadastrado')
    expect(page).to have_content('Carga Máxima não pode ficar em branco')
    expect(page).to have_content('Placa não pode ficar em branco')

  end

end