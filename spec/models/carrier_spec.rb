require 'rails_helper'

RSpec.describe Carrier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Nome está vazio' do
        # Arrange
        carrier = Carrier.new(brand_name: '', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')
        # Act
        # Assert
        expect(carrier).not_to be_valid
      end

      it 'falso quando Razão Social está vazio' do
        # Arrange
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: '', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')
        # Act / Assert
        expect(carrier).not_to be_valid
      end

      it 'falso quando Domínio está vazio' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: '', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')
        # Act / Assert
        expect(carrier).not_to be_valid
      end

      it 'valido quando situação cadastral está vazio - atributo com valor default' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: '', 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')
        # Act / Assert
        expect(carrier).to be_valid
      end

      it 'falso quando Razão Social está vazio' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')
        # Act / Assert
        expect(carrier).not_to be_valid
      end

      it 'falso quando Endereço está vazio' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: '', city: 'Goiania',
                              state: 'GO')
        # Act / Assert
        expect(carrier).not_to be_valid
      end

      it 'falso quando Cidade está vazio' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: '',
                              state: 'GO')
        # Act / Assert
        expect(carrier).not_to be_valid
      end

      it 'falso quando Estado está vazio' do
        carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: '')
        # Act / Assert
        expect(carrier).not_to be_valid
      end
    end
    
    it 'falso quando CNPJ já está cadastrado' do
      carrier_1 = Carrier.create!(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                                  registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                                  state: 'GO')
      
      carrier_2 = Carrier.new(brand_name: 'ACME Log - Br', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '66800929000103', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')

      # Act / Assert
      expect(carrier_2.valid?).to eq false
    end

    it 'falso quando CNPJ diferente de 14 caracteres' do
      carrier = Carrier.new(brand_name: 'ACME Log', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                                  registration_number: '668009290001034', address: 'Av. Brasil, 95', city: 'Goiania',
                                  state: 'GO')

      carrier_2 = Carrier.new(brand_name: 'ACME Log - Br', corporate_name: 'ACME Logistica Ltda', domain_name: 'acme.com.br', active_state: false, 
                              registration_number: '6680092900010', address: 'Av. Brasil, 95', city: 'Goiania',
                              state: 'GO')

      # Act / Assert
      expect(carrier).not_to be_valid
      expect(carrier_2).not_to be_valid
    end
  end
end
