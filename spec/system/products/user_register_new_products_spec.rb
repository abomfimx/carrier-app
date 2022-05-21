require 'rails_helper'

describe 'Usuário cadastra um Produto' do
  it 'a partir da tela inicial' do
    # Arrange
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar Produto'

    # Assert
    expect(page).to have_content('Cadastrar Novo Produto')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Peso')
    expect(page).to have_field('Largura')
    expect(page).to have_field('Altura')
    expect(page).to have_field('Profundidade')
    expect(page).to have_field('Código do Produto')
  end

  it 'com sucesso' do
    # Arrangge
    # Act
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Celular J11'
    fill_in 'Peso', with: 300
    fill_in 'Largura', with: 10
    fill_in 'Altura', with: 18
    fill_in 'Profundidade', with: 1
    fill_in 'Código do Produto', with: 'CEL-J11CEL-XYZ749999'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Produto cadastrado com sucesso'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Largura'
    expect(page).to have_content 'Altura'
    expect(page).to have_content 'Profundidade'
    expect(page).to have_content 'Código do Produto'
    expect(page).to have_content 'Celular J11'
    expect(page).to have_content '300'
    expect(page).to have_content '10'
    expect(page).to have_content '18'
    expect(page).to have_content 'CEL-J11CEL-XYZ749999'
  end

  it 'com dados incompletos' do
    # Arrangge
    # Act
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Celular J11'
    fill_in 'Peso', with: ''
    fill_in 'Largura', with: 10
    fill_in 'Altura', with: 18
    fill_in 'Profundidade', with: 1
    fill_in 'Código do Produto', with: ''
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Produto não cadastrado'
    expect(page).to have_content 'Peso não pode ficar em branco'
    expect(page).to have_content 'Código do Produto não pode ficar em branco'

  end
end
