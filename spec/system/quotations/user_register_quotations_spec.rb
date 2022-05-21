require 'rails_helper'

describe 'Usuário cadastra um novo Orçamento' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Orçamentos'
    end
    click_on 'Cadastrar Orçamento'

    # Assert
    expect(page).to have_content('Novo Orçamento')
    expect(page).to have_field('Data do Orçamento')
    expect(page).to have_field('Previsão de Entrega')
    expect(page).to have_field('Peso')
    expect(page).to have_field('Altura')
    expect(page).to have_field('Largura')
    expect(page).to have_field('Profundidade')
    expect(page).to have_field('Distância')
    expect(page).to have_field('Preço')
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
    click_on 'Orçamentos'
    click_on 'Cadastrar Orçamento'
    fill_in 'Data do Orçamento', with: '2022-05-21'
    fill_in 'Previsão de Entrega', with: '2022-05-23'
    fill_in 'Peso', with: '10'
    fill_in 'Altura', with: '12'
    fill_in 'Largura', with: '45'
    fill_in 'Profundidade', with: '6'
    fill_in 'Distância', with: '200'
    fill_in 'Preço', with:  250
    select 'XPTO Trans', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Orçamento cadastrado com sucesso')
    expect(page).to have_content('2022-05-21')
    expect(page).to have_content('2022-05-23')
    expect(page).to have_content('10')
    expect(page).to have_content('12')
    expect(page).to have_content('45')
    expect(page).to have_content('6')
    expect(page).to have_content('200')
    expect(page).to have_content('250')
    expect(page).to have_content('XPTO Trans')
  end

  it 'com dados incompletos' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú', state: 'SP')

    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    # Act
    visit root_path
    click_on 'Orçamentos'
    click_on 'Cadastrar Orçamento'
    fill_in "Data do Orçamento", with: "2022-05-27"
    fill_in 'Previsão de Entrega', with: "2022-05-25"
    fill_in 'Peso', with: '10'
    fill_in 'Altura', with: '12'
    fill_in 'Largura', with: '45'
    fill_in 'Profundidade', with: '6'
    fill_in 'Distância', with: ''
    fill_in 'Preço', with:  ''
    select 'XPTO Trans', from: 'Transportadora'
    click_on 'Salvar'

    # Assert 
    expect(page).to have_content('Orçamento não cadastrado')
    expect(page).to have_content('Previsão de Entrega deve ser maior que 2022-05-27')
    expect(page).to have_content('Distância não pode ficar em branco')
    expect(page).to have_content('Preço não pode ficar em branco')
  end
end
