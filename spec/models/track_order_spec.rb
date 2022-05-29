require 'rails_helper'

RSpec.describe TrackOrder, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Data está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
    
        warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
    
        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    
        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
            email: 'joana@gmailx.com.br')
    
        service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'approved', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
         
        track_order = TrackOrder.new( tracking_date: '', location: 'Araraquara', comments: 'Saiu do depósito de Araraquara', service_order: service_order)
    
        # Act
        # Assert
        expect(track_order).not_to be_valid
      end

      it 'falso quanto Localização está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
    
        warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
    
        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    
        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
            email: 'joana@gmailx.com.br')
    
        service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'approved', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
            
        track_order = TrackOrder.new( tracking_date: '2022-05-23', location: '', comments: 'Chegou no depósito de Ribeirão Preto', service_order: service_order)

        # Act
        # Assert
        expect(track_order).not_to be_valid
      end

      it 'falso quanto Comentários está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
    
        warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
    
        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    
        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
            email: 'joana@gmailx.com.br')
    
        service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'approved', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
         
        track_order = TrackOrder.new( tracking_date: '2022-05-22', location: 'Araraquara', comments: '', service_order: service_order)
    
        # Act
        # Assert
        expect(track_order).not_to be_valid
      end

      it 'falso quanto Código de Rastreio está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
    
        warehouse = Warehouse.create!(name: 'Depósito Regional Interior', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')
    
        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)
    
        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
            email: 'joana@gmailx.com.br')
    
        service_order = ServiceOrder.create!(placed_date: '2022-05-21', status: 'approved', tracking_id: 'XXXX-YYYYY-ZZZZ', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)
         
        track_order = TrackOrder.new( tracking_date: '2022-05-22', location: 'Araraquara', comments: 'Saiu do depósito de Araraquara')
    
        # Act
        # Assert
        expect(track_order).not_to be_valid
      end
    end
  end
end
