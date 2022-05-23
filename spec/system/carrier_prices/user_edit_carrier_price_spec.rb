require 'rails_helper'

describe 'Usuário edita um Preço' do
  it 'a partir da página de detalhes' do
    # Arrange
  carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

  CarrierPrice.create!(band_name: 'Faixa 1', min_volume: 1, max_volume: 5, min_weight: 1, max_weight:10_000, price: 7, carrier: carrier)

    # Act
    visit root_path
    click_on 'Preço'
    click_on 'Faixa 1'

    # Assert
    expect(page).to have_content 'Alterar Tabela de Preço'
    expect(page).to have_field('Tabela', with: 'Faixa 1')
    expect(page).to have_field('Volume mínimo', with: 1)
    expect(page).to have_field('Volume máximo', with: 5)
    expect(page).to have_field('Peso mínimo', with: 1)
    expect(page).to have_field('Peso máximo', with: 10000)
    expect(page).to have_field('Preço', with: 7)
    expect(page).to have_field('Transportadora', with: 1)
    expect(page).to have_content('Transportadora ACME LOG')
  end

  it 'com sucesso' do
    # Arrange
    # Arrange
    carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    Carrier.create!(brand_name: 'TransBrasil', corporate_name: 'ACME Logistica Ltda', domain_name: 'xpto.com.br', active_state: false, 
        registration_number: '66800929000109', address: 'Av. Brasil, 95', city: 'Ribeirão Preto',
        state: 'SP')
      
    CarrierPrice.create!(band_name: 'Faixa 1', min_volume: 1, max_volume: 5, min_weight: 1, max_weight:10_000, price: 7, carrier: carrier)

    # Act 
    visit root_path
    click_on 'Preço'
    click_on 'Faixa 1'
    fill_in 'Tabela', with: 'Faixa 3'
    fill_in 'Volume mínimo', with: '1'
    fill_in 'Volume máximo', with: '5'
    fill_in 'Peso mínimo', with: '1'
    fill_in 'Peso máximo', with: '10000'
    fill_in 'Preço', with: '7'
    select 'TransBrasil', from: 'Transportadora'
    click_on 'Salvar'
    # Assert
  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    CarrierPrice.create!(band_name: 'Faixa 1', min_volume: 1, max_volume: 5, min_weight: 12, max_weight:10_000, price: 7, carrier: carrier)

    # Act 
    visit root_path
    click_on 'Preço'
    click_on 'Faixa 1'
    fill_in 'Tabela', with: 'Faixa 1'
    fill_in 'Volume mínimo', with: ''
    fill_in 'Volume máximo', with: 5
    fill_in 'Peso mínimo', with: ''
    fill_in 'Peso máximo', with: 10000
    fill_in 'Preço', with: 7
    select 'ACME LOG', from: 'Transportadora'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Não foi possível atualizar o preço')
    expect(page).to have_content('Volume mínimo não pode ficar em branco')
    expect(page).to have_content('Peso mínimo não pode ficar em branco')
  end
end
