require 'rails_helper'

describe 'Usuário inscreve' do
  it 'com sucesso' do
    # Arrange
 
    # Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'José'
    fill_in 'E-mail', with: 'jose@gmail.com'
    fill_in 'Senha', with: '012345'
    fill_in 'Confirme sua senha', with: '012345'
    click_on 'Criar conta'

    # Assert
    expect(page).to have_content('Registro realizado com sucesso.')
    expect(page).to have_content('jose@gmail.com')
    user = User.last
    expect(user.name).to have_content('José')
    expect(page).to have_button 'Sair'
  end
end