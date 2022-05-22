require 'rails_helper'

describe 'Usuário vê detalhes de um Depósito' do
  it 'e vê header Lista de Deposítos' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Depósito'
    end
    # Assert
    expect(page).to have_content('Lista de Depósitos')
    expect(current_path).to eq warehouses_path
  end

  it 'e vê Depósitos cadastrados'  do
    #Arrange
    Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
    #Act
    visit(root_path)
    click_on('Depósitos')

    #Assert 
    expect(page).to have_content('Nome:')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Cidade')
    expect(page).to have_content('Estado:')
    expect(page).to have_content('Código:')
    expect(page).to have_content('Depósito Regional Interior')
    expect(page).to have_content('Araraquara')
    expect(page).to have_content('Avenida Marginal, 1000')
    expect(page).to have_content('SP')
    expect(page).to have_content('AQA')
  end

  it 'não existem Depósitos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Depósitos'
    # Assert
    expect(page).to have_content 'Nenhum Depósito cadastrado'
  end

end