require 'rails_helper'

describe 'Usuário visita a tela de Produtos' do
  it 'e vê header Lista de Produtos' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Produtos'
    end
    # Assert
    expect(page).to have_content('Lista de Produtos')
    expect(current_path).to eq products_path
  end

  it 'e vê Produtos cadastrados' do
    # Arrange
    Product.create!(product_name: 'J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
    Product.create!(product_name: 'TV-45', weight: 9000, width: 120, height: 45, depth: 5, sku: 'TV45-SAMTV45-XYZ749')
    # act
    visit root_path
    within('nav') do
      click_on 'Produtos'
    end

    # Assert
    expect(page).to have_content('J11')
    expect(page).to have_content('300')
    expect(page).to have_content('10')
    expect(page).to have_content('18')
    expect(page).to have_content('1')
    expect(page).to have_content('CEL-J11CEL-XYZ7499')

    expect(page).to have_content('TV-45')
    expect(page).to have_content('9000')
    expect(page).to have_content('120')
    expect(page).to have_content('45')
    expect(page).to have_content('5')
    expect(page).to have_content('TV45-SAMTV45-XYZ749')
  end

  it 'não existem Produtos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Produtos'
    # Assert
    expect(page).to have_content 'Nenhum Produto cadastrado'
  end
end