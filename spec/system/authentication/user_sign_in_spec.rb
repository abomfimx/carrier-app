require 'rails_helper'

describe 'Usuário faz autenticação' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'jose@gmail.com', password: '012345')
    # Act
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'E-mail', with: 'jose@gmail.com'
      fill_in 'Senha', with: '012345'
      click_on 'Entrar'
    end
    # Assert
    expect(page).to have_content('Login efetuado com sucesso')
    within('nav') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_button 'Sair'  
      expect(page).to have_content('jose@gmail.com')
    end
  end

  it 'e faz logout' do
    # Arrange
    User.create!(email: 'jose@gmail.com', password: '012345')
    # Act
    visit root_path
    click_on 'Entrar'
    within 'form' do
      fill_in 'E-mail', with: 'jose@gmail.com'
      fill_in 'Senha', with: '012345'
      click_on 'Entrar'
      click_on 'Sair'
    end
    # Assert
    expect(page).to have_content('Logout efetuado com sucesso')
      expect(page).to have_link 'Entrar'
      expect(page).not_to have_button 'Sair'  
      expect(page).not_to have_content('jose@gmail.com')
  end

end