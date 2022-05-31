require 'rails_helper'

RSpec.describe Quotation, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Data do Orçamento está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        quotation = Quotation.new(quotation_date: '', weight: 5, height: 1, width:10, depth: 7, distance: 100)
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end

      # it 'falso quanto Previsão de Entrega está vazio' do
      #   # Arrange
      #   carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      #     registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

      #     quotation = Quotation.new(quotation_date: '', weight: 5, height: 1, width:10, depth: 7, distance: 100)

      #   # Act
      #   # Assert
      #   expect(quotation).not_to be_valid
      # end

      it 'falso quanto Peso está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

          quotation = Quotation.new(quotation_date: '2020-05-22', weight: '', height: 1, width:10, depth: 7, distance: 100)
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end

      it 'falso quanto Altura está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

          quotation = Quotation.new(quotation_date: '2020-05-22', weight: 5, height: '', width:10, depth: 7, distance: 100)
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end


      it 'falso quanto Largura está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
          
          quotation = Quotation.new(quotation_date: '2020-05-22', weight: 5, height: 1, width:'', depth: 7, distance: 100)
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end

      it 'falso quanto Profundidade está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        quotation = Quotation.new(quotation_date: '2020-05-22', weight: 5, height: 1, width:10, depth: '', distance: 100)
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end

      it 'falso quanto Distancia está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        quotation = Quotation.new(quotation_date: '2020-05-22', weight: 5, height: 1, width:10, depth: 7, distance: '')
        # Act
        # Assert
        expect(quotation).not_to be_valid
      end

      # it 'falso quanto Preço está vazio' do
      #   # Arrange
      #   carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
      #     registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

      #   quotation = Quotation.new(quotation_date: '2020-05-22', weight: 5, height: 1, width:10, depth: 7, distance: 100)
      #   # Act
      #   # Assert--
      #   expect(quotation).not_to be_valid
      # end


    #   it 'falso quanto Transportadora está vazio' do
    #     # Arrange
    #     quotation = Quotation.new(quotation_date: '2022-05-21', delivery_date: '2022-05-22', weight: 5, height: 1, width:10, depth: 7, distance: 100, shipping_price: 250) 
    #     # Act
    #     # Assert
    #     expect(quotation).not_to be_valid
    #   end
    end

    # it 'falso quanto Data do Orçamento maior que a Previsão de Entrega' do
    #   # Arrange
    #   carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
    #     registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

    #   quotation = Quotation.new(quotation_date: '2022-05-25', delivery_date: '2022-05-22', weight: 5, height: 9, width:5 , depth: 4, distance: 100, shipping_price: '', carrier: carrier)
    #   # Act
    #   # Assert
    #   expect(quotation).not_to be_valid
    # end
  end
end
