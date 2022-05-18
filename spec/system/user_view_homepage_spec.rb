require 'rails_helper'

describe 'Usuário acessa tela inicial' do
  it 'e vễ o nome da app' do
    # Arrange
    # Act 
    visit(root_path)
    # Assert
    expect(page).to have_content('Sistema de Entregas')
  end
end