require 'rails_helper'

RSpec.describe Vehicule, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false quando Marca está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: 'ASD4493', brand_name: '', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end

      it 'false quando Modelo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: '', year: '2021', max_load: 15_800, carrier: carrier)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end

      it 'false quando Placa está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: '', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end

      it 'false quando Ano está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '', max_load: 15_800, carrier: carrier)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end

      it 'false quando Carga Máxima está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: '', carrier: carrier)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end

      it 'false quando Transportadora está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
    
        vehicle = Vehicule.new(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800)
        # Act
        # Assert
        expect(vehicle).not_to be_valid
      end
    end

    it 'falso quando a Placa já está cadastrada' do
    # Arrange
    carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
      registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
      state: 'SP')

    vehicle_one = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    vehicle_two = Vehicule.new(plate_number: 'ASD4493', brand_name: 'Mercedes', vehicle_model: 'Atego 1419', year: '2020', max_load: 9_500, carrier: carrier)
    # Act / Assert
    expect(vehicle_two).not_to be_valid
    end
  end
end
