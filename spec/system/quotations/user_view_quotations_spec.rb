require 'rails_helper'

describe 'Usuário visita a tela de Cadastro de Orçamentos' do
  it 'e vê header Lista de Preços' do
    # Arrange
    # Act
    visit root_path
    within('nav') do
      click_on 'Orçamento'
    end
    # Assert
    expect(page).to have_content('Lista de Orçamentos')
    expect(current_path).to eq quotations_path
  end

  it 'e vê Orçamentos cadastrados' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
                              registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
                              state: 'SP')
  
    Quotation.create!(quotation_date: '2022-05-21', weight: 5, height: 1, width:10, depth: 7, distance: 100)
    # Act
    visit root_path
    within('nav') do
      click_on 'Orçamentos'
    end
    # Assert
    expect(page).to have_content('21/05/2022')
    expect(page).to have_content('5')
    expect(page).to have_content('1')
    expect(page).to have_content('10')
    expect(page).to have_content('7')
    expect(page).to have_content('100')
  end

  it 'não existem Orçamento cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Orçamentos'

    # Assert
    expect(page).to have_content 'Nenhum Orçamento cadastrado'
  end
end