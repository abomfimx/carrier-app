require 'rails_helper'

describe 'Usuário visita a tela de Transportadoras' do
  it 'se estiver autenticado' do
    # Arrange
    # Act
    visit(root_path)
    within('nav') do
      click_on 'Transportadoras'
    end
    # Assert
    expect(current_path).to eq new_user_session_path

  end

  it 'e vê header Lista de Transportadoras' do 
    # Arrange 
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    # Act
    login_as(user)
    visit(root_path)
    within('nav') do
      click_on 'Transportadoras'
    end
    # Assert
    expect(current_path).to eq carriers_path
  end

  it 'e vê as transportadoras cadastradas' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                    state: 'SP')
    Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
                    registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                    state: 'GO')
    # Act 
    login_as(user)
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
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    # Act
    login_as(user)
    visit(root_path)
    click_on 'Transportadoras'
    # Assert
    expect(page).to have_content('Não existem transportadoras cadastradas')
  end
end

