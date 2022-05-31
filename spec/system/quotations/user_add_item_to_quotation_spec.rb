require 'rails_helper'

describe 'Usuario adiciona orçamentos' do
  it 'com sucesso' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    quotation = Quotation.create!(quotation_date: '2022-05-21', weight: 5, height: 120, width:250, depth: 40, distance: 100, quotation_code: 'XXXXXXXX')
    
    # Act
    visit root_path
    within('nav') do
    click_on 'Orçamentos'
    end
    click_on quotation.quotation_code
    # click_on 'Listar Cotação'
    # assert
      expect(current_path).to eq quotation_path(quotation.id)
      expect(page).to have_content('Orçamento - XXXXXXXX')
      expect(page).to have_content('Data do Orçamento: 21/05/2022')
      expect(page).to have_content('Volume: 1.2m3')
  end
end