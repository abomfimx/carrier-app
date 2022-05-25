require 'rails_helper'

describe 'Usuário vê detalhes da Transportadora' do
  it 'a partir da tela inicial' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logística S/A',  domain_name: 'xpto.com.br', active_state: 'false', 
                    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                    state: 'SP')
    # Act
    login_as(user)
    visit(root_path)
    within('nav') do
      click_on 'Transportadoras'
    end 
    click_on 'XPTO Trans'

    # Assert
    expect(page).to have_content('Transportadora - XPTO Trans')
    expect(page).to have_content('Razão Social: XPTO Logística S/A')
    expect(page).to have_content('Domínio: xpto.com.br')
    expect(page).to have_content('Situação cadastral: Inativa')
    expect(page).to have_content('CNPJ: 03680413000152')
    expect(page).to have_content('Endereço: Av. Interlagos, 1000')
    expect(page).to have_content('Cidade: Jaú')
    expect(page).to have_content('Estado: SP')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logística S/A',  domain_name: '@xpto.com.br', active_state: false, 
                    registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                    state: 'SP')

    # Act
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'XPTO Trans'
    click_on 'Home'
    # Assert
    expect(current_path).to eq root_path
  end
end