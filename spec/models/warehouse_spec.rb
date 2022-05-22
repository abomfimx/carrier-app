require 'rails_helper'

RSpec.describe Warehouse, type: :model do
describe '#valid?' do
    context 'presence' do
      it 'falso quando Nome está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: '', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU')
                                
        # Act
        # Assert
        expect(warehouse).not_to be_valid
      end

      it 'falso quando Endereço está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio - Central', address:'',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU')
        # Act
        # Assert
        expect(warehouse).not_to be_valid
      end


      it 'falso quando Cidade está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: '', state: 'RJ', code: 'SDU')
        # Act
        # Assert
        expect(warehouse).not_to be_valid
      end

      it 'falso quando Estado está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: '', code: 'SDU')
        # Act
        # Assert
        expect(warehouse).not_to be_valid
      end
      
      it 'falso quando Código está vazio' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: '')
                                
        # Act
        # Assert
        expect(warehouse).not_to be_valid
      end
    end

    it 'falso quando Código já está em uso' do
      # Arrangge
      warehouse = Warehouse.create!(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU')
      warehouse1 = Warehouse.new(name: 'Rio - Central 2', address:'Av. Brasil, 200',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU')

        # Act
        # Assert
        expect(warehouse1).not_to be_valid
    end

    it 'falso quando Nome já está em uso' do
      # Arrangge
      warehouse = Warehouse.create!(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU')
      warehouse1 = Warehouse.new(name: 'Rio - Central', address:'Av. Brasil, 200',city: 'Rio de Janeiro', state: 'RJ', code: 'GIG')

        # Act
        expect(warehouse1).not_to be_valid false
    end

    it 'falso quando Código diferente de 3 caracteres' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: 'SDU1')
      warehouse1 = Warehouse.new(name: 'Rio - Central', address:'Av. Atlantica, 1200',city: 'Rio de Janeiro', state: 'RJ', code: 'SD')
      # Act
      # Act
      expect(warehouse).not_to be_valid false
      expect(warehouse1).not_to be_valid false
    end
  end
end
