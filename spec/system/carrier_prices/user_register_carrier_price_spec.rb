require 'rails_helper'

describe 'Usuário cadastra um novo preço' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    click_on 'Preço'
    click_on 'Cadastrar Preço'

    # Assert
    expect(page).to have_content('Nova Tabela de Preço')
    expect(page).to have_field('Tabela')
    expect(page).to have_field('Volume mínimo')
    expect(page).to have_field('Volume máximo')
    expect(page).to have_field('Peso mínimo')
    expect(page).to have_field('Peso máximo')
    expect(page).to have_field('Preço')
    expect(page).to have_field('Transportadora')
  end

  it 'com sucesso' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    # Act
    visit root_path
    click_on 'Preço'
    click_on 'Cadastrar Preço'
    fill_in 'Tabela', with: 'Faixa 1'
    fill_in 'Volume mínimo', with: '0'
    fill_in 'Volume máximo', with: '50'
    fill_in 'Peso mínimo', with: '100'
    fill_in 'Peso máximo', with: '1000'
    fill_in 'Preço', with: '500'
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Preço cadastrado com sucesso')
    expect(page).to have_content('Faixa 1')
    expect(page).to have_content('0')
    expect(page).to have_content('50')
    expect(page).to have_content('100')
    expect(page).to have_content('1000')
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
    click_on 'Preço'
    click_on 'Cadastrar Preço'
    fill_in 'Tabela', with: 'Faixa 1'
    fill_in 'Volume mínimo', with: ''
    fill_in 'Volume máximo', with: '50'
    fill_in 'Peso mínimo', with: '100'
    fill_in 'Peso máximo', with: ''
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Preço não cadastrado')
    expect(page).to have_content('Peso máximo não pode ficar em branco')
    expect(page).to have_content('Volume mínimo não pode ficar em branco')

  end
end
