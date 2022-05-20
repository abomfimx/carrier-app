require 'rails_helper'

describe 'Usuário vê detalhes do Veículo' do
  it 'a partir da tela inicial' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Log', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Volvo'
    # Assert
    expect(page).to have_content('Volvo')
    expect(page).to have_content('Modelo: VM4X2R')
    expect(page).to have_content('Placa: ASD4493')
    expect(page).to have_content('Ano: 2021')
    expect(page).to have_content('Carga Máxima: 15800')
    expect(page).to have_content('Transportadora: XPTO Log')

  end

  it 'e volta a tela inicial' do
    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Home'
    # Assert
    expect(current_path).to eq root_path
  end

  it 'e volta a lista de veículos' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Log', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)    
    # Act
    visit root_path
    click_on 'Veículos'
    click_on 'Volvo'
    click_on 'Voltar'
    # Assert
    expect(current_path).to eq vehicules_path
  end
end