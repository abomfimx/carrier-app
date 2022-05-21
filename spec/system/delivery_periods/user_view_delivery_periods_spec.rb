require 'rails_helper'

describe 'Usuário visita a tela de Cadastro de Prazos' do
  it 'e vê header Lista de Prazos' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Prazos'
    end
    # Assert
    expect(page).to have_content('Lista de Prazos')
    expect(current_path).to eq delivery_periods_path
  end

  it 'e vê Prazos cadastrados' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                            registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                           state: 'SP')
  
    DeliveryPeriod.create!(band_name: 'Faixa 1', min_distance: 2, max_distance: 100, days: 1, carrier: carrier)
    # Act
    visit root_path
    within('nav') do
      click_on 'Prazos'
    end
    # Assert
    expect(page).to have_content('Faixa 1')
    expect(page).to have_content('2')
    expect(page).to have_content('100')
    expect(page).to have_content('1')
    expect(page).to have_content('XPTO Trans')
  end

  it 'não existem Prazos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Prazos'

    # Assert
    expect(page).to have_content 'Nenhum Prazo cadastrado'
  end

end