require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do
  describe 'gera um Código de Rastreamento automático' do
    it 'ao criar um novo pedido' do
      # Arrange
      carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
        registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
        state: 'SP')
        
      product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

      warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

      vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

      customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                      email: 'joana@gmailx.com.br')

      service_order = ServiceOrder.new(placed_date: '2022-05-27', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)     

      # Act
      service_order.save!
      result = service_order.tracking_id

      # Assert
        expect(result).not_to be_empty
        expect(result.length).to eq 15
    end

    it 'e o código é único' do
      # Arrange
      carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
        registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
        state: 'SP')
        
      product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

      warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

      vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

      customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                      email: 'joana@gmailx.com.br')

      so_1 = ServiceOrder.create!(placed_date: '2022-05-27', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)     

      so_2 = ServiceOrder.new(placed_date: '2022-05-27', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

      # Act
      so_2.save!
      result = so_2.tracking_id

      # Assert
        expect(so_2.tracking_id).not_to eq so_1.tracking_id
    end
  end

  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Data da OS está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '', status: 'Pendente',  distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'falso quanto Situação da Ordem está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-23', status: '', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'falso quanto Código de Rastreio está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente',  distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).to be_valid
      end

      it 'falso quanto Distância está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: '', carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'falso quanto Transportadora está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: 110, customer: customer, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'falso quanto Cliente está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, warehouse: warehouse, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'falso quanto Depósito está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, vehicule: vehicle, product: product)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end

      it 'válido quanto Veículo está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, product: product)

        # Act
        # Assert
        expect(service_order).to be_valid
      end

      it 'falso quanto Produto está vazio' do
        # Arrange
        carrier = Carrier.create!(brand_name: 'XPTO Trans', corporate_name: 'XPTO Logistica S/A',  domain_name: '@xpto.com.br', active_state: false, 
          registration_number: '03680413000152', address: 'Av. Interlagos, 1000', city: 'Jaú',
          state: 'SP')
          
        product = Product.create!(product_name: 'Samsung J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')

        warehouse = Warehouse.create!(name: 'Depósito Regional Interior - 5', city: 'Araraquara', address: 'Avenida Marginal, 1000', state: 'SP', code: 'AQA')

        vehicle = Vehicule.create!(plate_number: 'ASD4493', brand_name: 'Volvo', vehicle_model: 'VM4X2R', year: '2021', max_load: 15_800, carrier: carrier)

        customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', 
                        email: 'joana@gmailx.com.br')

        service_order = ServiceOrder.new(placed_date: '2022-05-21', status: 'Pendente', distance: 110, carrier: carrier, customer: customer, warehouse: warehouse, vehicule: vehicle)

        # Act
        # Assert
        expect(service_order).not_to be_valid
      end
    end
  end
end
