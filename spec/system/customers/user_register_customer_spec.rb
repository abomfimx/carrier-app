require 'rails_helper'

describe 'Usuário cadastra um Cliente' do
  it 'a partir da tela inicial' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Clientes'
    end
    click_on 'Cadastrar Cliente'

    # Assert
    expect(page).to have_content('Novo Cliente')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('CPF')
    expect(page).to have_field('E-mail')
  end

  it 'com sucesso' do 
    # Arrange 
    # Act
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'

    fill_in 'Nome', with: 'Joana'
    fill_in 'Endereço', with: 'Av. Interlagos, 1000'
    fill_in 'Cidade', with: 'Jaú'
    fill_in 'Estado', with: 'SP'
    fill_in 'CPF', with: '00846428075'
    fill_in 'E-mail', with: 'joana@gmailx.com.br'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Cliente cadastrado com sucesso')
    expect(page).to have_content('Joana')
    expect(page).to have_content('Av. Interlagos, 1000')
    expect(page).to have_content('Jaú')
    expect(page).to have_content('SP')
    expect(page).to have_content('00846428075')
    expect(page).to have_content('joana@gmailx.com.br')
  end

  it 'com dados incompletos' do
    # Arrange
    # Act
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'

    fill_in 'Nome', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'CPF', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Não foi possível cadastrar o Cliente'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'CPF não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
  end

end