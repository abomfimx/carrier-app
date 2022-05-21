require 'rails_helper'

describe 'Usuário visita a tela de Cadastro de Preços' do
  it 'e vê header Lista de Preços' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Preços'
    end
    # Assert
    expect(page).to have_content('Lista de Preços')
    expect(current_path).to eq carrier_prices_path
  end

  it 'e vê Preços cadastrados' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                            registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                           state: 'SP')
  
    CarrierPrice.create!(band_name: 'Faixa 1', min_volume: 0, max_volume: 5, min_weight: 1, max_weight:10000, price: 7, carrier: carrier)
    # Act
    visit root_path
    within('nav') do
      click_on 'Preços'
    end
    # Assert
    expect(page).to have_content('Faixa 1')
    expect(page).to have_content('0')
    expect(page).to have_content('5')
    expect(page).to have_content('1')
    expect(page).to have_content('10000')
    expect(page).to have_content('7')
    expect(page).to have_content('XPTO Trans')
 
  end

  it 'não existem Preços cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Preços'

    # Assert
    expect(page).to have_content 'Nenhum Preço cadastrado'
  end
end