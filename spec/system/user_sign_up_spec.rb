require 'rails_helper'

describe 'Usuário inscreve' do
  it 'com sucesso' do
    # Arrange
    # Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Josefa'
    fill_in 'E-mail', with: 'josefa@xpto.com.br'
    fill_in 'Senha', with: '012349'
    fill_in 'Confirme sua senha', with: '012349'
    click_on 'Criar conta'
    
    # # Assert
    expect(page).to have_content('Registro realizado com sucesso.')
    expect(page).to have_content('josefa@xpto.com.br')
    user = User.last
    expect(user.name).to have_content('Josefa')
    expect(page).to have_button 'Sair'
  end
end