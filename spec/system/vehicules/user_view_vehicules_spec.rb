require 'rails_helper'

describe 'Usuário visita a tela de Veículos' do
  it 'e vễ header Lista de Veículos' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Veículos'
    end
    # Assert
    expect(page).to have_content('Lista de Veículos')
    expect(current_path).to eq vehicules_path
  end

  it 'e vê Veículos cadastrados' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    Vehicule.create!(plate_number: 'H345G90', brand_name: 'Mercedes', vehicle_model: 'Atego 1419', year: '2020', max_load: 9_500, carrier: carrier)
    # Act
    visit root_path
    within('nav') do
      click_on 'Veículos'
    end
    # Assert
    expect(page).to have_content('Volvo')
    expect(page).to have_content('VM4X2R')
    expect(page).to have_content('15800')
    expect(page).to have_content('Mercedes')
    expect(page).to have_content('Atego 1419')
    expect(page).to have_content('9500')
  end

  it 'não existem Veículos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Veículos'

    # Assert
    expect(page).to have_content 'Nenhum veículo cadastrado'
  end
end