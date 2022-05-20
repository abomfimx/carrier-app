require 'rails_helper'

RSpec.describe CarrierPrice, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Tabela está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: '', min_volume: 1, max_volume: 5, min_weight: 1, max_weight:10_000, price: 7, carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Volume Mínimo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: '', max_volume: 5, min_weight: 1, max_weight:10_000, price: 7, carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Volume Máximo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: '', min_weight: 1, max_weight:10_000, price: 7, carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Peso Mínimo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: 15, min_weight: '', max_weight:10_000, price: 7, carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Peso Máximo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: 15, min_weight: 10, max_weight: '', price: 7, carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Preço está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: 15, min_weight: 10, max_weight: '10_000', price: '', carrier: carrier)
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end

      it 'falso quanto Transportadora está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        carrier_price = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: 15, min_weight: 10, max_weight: '10_000', price: 7 )
        # Act
        # Assert
        expect(carrier_price).not_to be_valid
      end
    end
  end
end