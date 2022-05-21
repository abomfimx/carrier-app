require 'rails_helper'

describe 'Usuário cadastra um novo prazo' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    click_on 'Prazo'
    click_on 'Cadastrar Prazo'

    # Assert
    expect(page).to have_content('Nova Tabela de Prazos')
    expect(page).to have_field('Tabela')
    expect(page).to have_field('Distância mínima')
    expect(page).to have_field('Distância máxima')
    expect(page).to have_field('Dias')
    expect(page).to have_field('Transportadora')
  end

  it 'com sucesso' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
     state: 'SP')

    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 


    # Act
    visit root_path
    click_on 'Prazo'
    click_on 'Cadastrar Prazo'
    fill_in 'Tabela', with: 'Faixa 1'
    fill_in 'Distância mínima', with: 2
    fill_in 'Distância máxima', with: 50
    fill_in 'Dias', with: 1
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Prazo cadastrado com sucesso')
    expect(page).to have_content('Faixa 1')
    expect(page).to have_content('2')
    expect(page).to have_content('50')
    expect(page).to have_content('1')
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
    click_on 'Prazo'
    click_on 'Cadastrar Prazo'
    fill_in 'Tabela', with: 'Faixa 1'
    fill_in 'Distância mínima', with: 2
    fill_in 'Distância máxima', with: ''
    fill_in 'Dias', with: ''
    select 'XPTO Trans', from: 'Transportadora'
    click_on 'Salvar'


    # Assert 
    expect(page).to have_content('Prazo não cadastrado')
    expect(page).to have_content('Distância máxima não pode ficar em branco')
    expect(page).to have_content('Dias não pode ficar em branco')

  end
end
