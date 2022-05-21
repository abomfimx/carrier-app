require 'rails_helper'

describe 'Usuário visita a tela de Clientes' do
  it 'e vê header Lista de Clientes' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Clientes'
    end
    # Assert
    expect(page).to have_content('Lista de Clientes')
    expect(current_path).to eq customers_path
  end

  it 'e vê Clientes cadastrados' do
    # Arrange
    Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

    # Act
    visit root_path
    within('nav') do
      click_on 'Clientes'
    end
    # Assert
    expect(page).not_to have_content('Não existem Clientes cadastrados')
    expect(page).to have_content('Nome:')
    expect(page).to have_content('Endereço:')
    expect(page).to have_content('Cidade:')
    expect(page).to have_content('Estado:')
    expect(page).to have_content('CPF:')
    expect(page).to have_content('E-mail:')
    expect(page).to have_content('Joana da Silva')
    expect(page).to have_content('Rua da Mooca, 175')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('SP')
    expect(page).to have_content('00846428075')
    expect(page).to have_content('joana@gmailx.com.br')
 
  end

  it 'não existem Clientes cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Clientes'

    # Assert
    expect(page).to have_content 'Nenhum Cliente cadastrado'
  end
end