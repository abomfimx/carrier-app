require 'rails_helper'

describe 'Usuário cadastra uma transportadora' do
  it 'a partir da tela inicial' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: 'xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    user = User.create!(name: 'Claudio', email: 'claudio@xpto.com.br', password: 'password')
    # Act
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar Transportadora'

    # Assert
    expect(page).to have_content('Nova Transportadora')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('Domínio')
    expect(page).to have_field('Transportadora Ativa')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
  end

  it 'com sucesso' do 
    # Arrange 
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    # Act
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar Transportadora'

    fill_in 'Nome', with: 'XPTO Trans'
    fill_in 'Razão Social', with: 'XPTO Logística S/A'
    fill_in 'Domínio', with: '@xpto.com.br'
    uncheck 'Transportadora Ativa'
    fill_in 'CNPJ', with: '03680413000152'
    fill_in 'Endereço', with: 'Av. Interlagos, 1000'
    fill_in 'Cidade', with: 'Jaú'
    fill_in 'Estado', with: 'SP'
    click_on 'Criar Transportadora'

    # Assert
    expect(page).to have_content('Transportadora cadastrada com sucesso')
    expect(page).to have_content('XPTO Trans')
    expect(page).to have_content('XPTO Logística S/A')
    expect(page).to have_content('@xpto.com.br')
    expect(page).to have_content('Inativa')
    expect(page).to have_content('03680413000152')
    expect(page).to have_content('Av. Interlagos, 1000')
    expect(page).to have_content('Jaú')
    expect(page).to have_content('SP')
  end

  it 'com dados incompletos' do
    # Arrange
    user = User.create!(name: 'Claudia', email: 'claudia@gmail.com', password: 'password')
    # Act
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar Transportadora'

    fill_in 'Nome', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'Domínio', with: ''
    uncheck 'Transportadora Ativa'
    fill_in 'CNPJ', with: '03680413000152'
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    click_on 'Criar Transportadora'

    # Assert
    expect(page).to have_content 'Não foi possível cadastrar a transportadora'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).not_to have_checked_field('Transportadora Ativa')
    expect(page).to have_content 'Domínio não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
  end

end