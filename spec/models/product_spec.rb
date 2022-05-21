require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando Nome está vazio' do
        # Arrange
        product = Product.new(product_name: '', weight: 300, width: 10, height: 18, depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        # Act
        # Assert
        expect(product).to_not be_valid
      end

      it 'falso quando Peso está vazio' do
        # Arrange
        product = Product.new(product_name: 'Celular J11', weight: '', width: 10, height: 18, depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        # Act
        # Assert
        expect(product).to_not be_valid
      end

      it 'falso quando Largura está vazio' do
        # Arrange
        product = Product.new(product_name: 'Celular J11', weight: 300, width: '', height: 18, depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        # Act
        # Assert
        expect(product).to_not be_valid
      end

      it 'falso quando Altura está vazio' do
        # Arrange
        product = Product.new(product_name: 'Celular J11', weight: 300, width: 10, height: '', depth: 1, sku: 'CEL-J11CEL-XYZ749999')
        # Act
        # Assert
        expect(product).to_not be_valid
      end

      it 'falso quando Profundidade está vazio' do
        # Arrange
        product = Product.new(product_name: 'Celular J11', weight: 300, width: 10, height: 18, depth: '', sku: 'CEL-J11CEL-XYZ749999')
        # Act
        # Assert
        expect(product).to_not be_valid
      end

      it 'falso quando Código do Produto está vazio' do
        # Arrange
        product = Product.new(product_name: 'Celular J11', weight: 300, width: 10, height: 18, depth: 1, sku: '')
        # Act
        # Assert
        expect(product).to_not be_valid
      end
    end
      it 'falso quando o Código de Produto já está em uso' do
        # Arrange

        product1 = Product.create!(product_name: 'Celular J11', weight: 300, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
        product2 = Product.new(product_name: 'TV-45', weight: 9000, width: 120, height: 45, depth: 5, sku: 'CEL-J11CEL-XYZ7499')

        # Act
        # result = second_pm.valid
        # Assert
        expect(product2).to_not be_valid
      end

      it 'falso quando Peso menor ou igual a zero' do
        # Arrange
        product1 = Product.new(product_name: 'Celular J11', weight: 0, width: 10, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
        product2 = Product.new(product_name: 'TV-45', weight: -10, width: 120, height: 45, depth: 5, sku: 'TV45-SAMTV45-XYZ749')
        # Act
        # Assert
        expect(product1).to_not be_valid
        expect(product2).to_not be_valid
      end

      it 'falso quando Altura menor ou igual a zero' do
        # Arrange
        product1 = Product.new(product_name: 'Celular J11', weight: 300, width: 10, height: 0,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
        product2 = Product.new(product_name: 'TV-45', weight: 9000, width: 120, height: -45, depth: 5, sku: 'TV45-SAMTV45-XYZ749')
        # Act
        # Assert
        expect(product1).to_not be_valid
        expect(product2).to_not be_valid
      end

      it 'falso quando Largura menor ou igual a zero' do
        # Arrange
        product1 = Product.new(product_name: 'Celular J11', weight: 300, width: 0, height: 18,  depth: 1, sku: 'CEL-J11CEL-XYZ7499')
        product2 = Product.new(product_name: 'TV-45', weight: 9000, width: -10, height: 45, depth: 5, sku: 'TV45-SAMTV45-XYZ749')
        # Act
        # Assert
        expect(product1).to_not be_valid
        expect(product2).to_not be_valid
      end

      it 'falso quando Profundidade menor ou igual a zero' do
        # Arrange
        product1 = Product.new(product_name: 'Celular J11', weight: 300, width: 10, height: 18,  depth: 0, sku: 'CEL-J11CEL-XYZ7499')
        product2 = Product.new(product_name: 'TV-45', weight: 9000, width: 120, height: 45, depth: -5, sku: 'TV45-SAMTV45-XYZ749')
        # Act
        # Assert
        expect(product1).to_not be_valid
        expect(product2).to_not be_valid
      end
  end
end

