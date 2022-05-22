require 'rails_helper'

describe 'Usuario cadastra um Depósito' do
  it 'a partir da tela inicial' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Depósitos'
    end
    click_on 'Cadastrar Depósito'

    # Assert
    expect(page).to have_field('Nome')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('Código')
  end

  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Depósitos'
    click_on 'Cadastrar Depósito'
    fill_in 'Nome', with: 'Depósito Rio Capital'
    fill_in 'Endereço', with: 'Avenida do Copacabana, 1000'
    fill_in 'Cidade', with: 'Rio de Janeiro'
    fill_in 'Estado', with: 'RJ'
    fill_in 'Código', with: 'RIO'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Depósito cadastrado com sucesso'
    expect(page).to have_content 'Depósito Rio Capital'
    expect(page).to have_content 'Avenida do Copacabana, 1000'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RJ'
    expect(page).to have_content 'RIO'
    expect(current_path).to eq warehouses_path
  end

  it 'com dados incompletos' do
    # Arrange
    # Act
    visit root_path
    click_on 'Depósitos'
    click_on 'Cadastrar Depósito'
    fill_in 'Nome', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Código', with: ''

    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Depósito não cadastrado'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Código não pode ficar em branco'
   end
end