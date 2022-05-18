require 'rails_helper'

describe 'Usuário visita a tela de Transportadoras' do
  it 'e vê header Lista de Trasnportadoras' do 
    # Arrange 
    # Act
    visit(root_path)
    within('nav') do
      click_on 'Transportadoras'
    end
  end

  it 'e vê as transportadoras cadastradas' do
    # Arrange
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                    state: 'SP')
    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
                    registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                    state: 'GO')
    # Act 
    visit(root_path)
    click_on 'Transportadoras'

    # Assert
    expect(page).not_to have_content('Não existem transportadoras cadastradas')
    expect(page).to have_content('Nome:')
    expect(page).to have_content('Localização:')
    expect(page).to have_content('XPTO Trans')
    expect(page).to have_content('Jaú - SP')
    expect(page).to have_content('ACME LOG')
    expect(page).to have_content('Goiania - GO')

  end

  it 'e não existem transportadoras cadastradas' do
    # Arrange
    # Act
    visit(root_path)
    click_on 'Transportadoras'
    # Assert
    expect(page).to have_content('Não existem transportadoras cadastradas')
  end
end

