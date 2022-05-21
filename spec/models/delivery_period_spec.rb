require 'rails_helper'

RSpec.describe DeliveryPeriod, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Tabela está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        delivery_period = DeliveryPeriod.new(band_name: '', min_distance: 2, max_distance: 100, days: 1, carrier: carrier)
        # Act
        # Assert
        expect(delivery_period).not_to be_valid
      end

      it 'falso quanto Distância Mínima está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        delivery_period = DeliveryPeriod.new(band_name: 'Faixa 1', min_distance: '', max_distance: 100, days: 1, carrier: carrier)
        # Act
        # Assert
        expect(delivery_period).not_to be_valid
      end

      it 'falso quanto Distância Máxima está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        delivery_period = DeliveryPeriod.new(band_name: 'Faixa 1', min_distance: 2, max_distance: '', days: 1, carrier: carrier)
        # Act
        # Assert
        expect(delivery_period).not_to be_valid
      end

      it 'falso quanto Dias está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 

        delivery_period = DeliveryPeriod.new(band_name: 'Faixa 1', min_distance: 2, max_distance: 100, days: '', carrier: carrier)
        # Act
        # Assert
        expect(delivery_period).not_to be_valid
      end

      it 'falso quanto Transportadora está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'ACME LOG', corporate_name: 'ACME Logistica Ltda', domain_name: '@acme.com.br', active_state: false, 
          registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania', state: 'GO') 
    
        delivery_period = CarrierPrice.new(band_name: 'Faixa 1', min_volume: 10, max_volume: 15, min_weight: 10, max_weight: '10_000', price: 7 )
        # Act
        # Assert
        expect(delivery_period).not_to be_valid
      end
    end
  end
end
