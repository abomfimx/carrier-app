require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quanto Nome está vazio' do
        # Arrange
        customer = Customer.new(name: '', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

        # Act
        # Assert
        expect(customer).not_to be_valid
      end

      it 'falso quando Endereço está vazio' do
        customer = Customer.new(name: 'Joana da Silva', address: '', city: 'São Paulo', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')
        # Act / Assert
        expect(customer).not_to be_valid
      end

      it 'falso quando Cidade está vazio' do
        customer = Customer.new(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: '', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')
        # Act / Assert
        expect(customer).not_to be_valid
      end

      it 'falso quando Estado está vazio' do
        customer = Customer.new(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: '', cpf:'00846428075', email: 'joana@gmailx.com.br')
        # Act / Assert
        expect(customer).not_to be_valid
      end
    end
    
    it 'falso quando CPF já está cadastrado' do
      customer = Customer.create!(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')
      
      customer_two = Customer.new(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'00846428075', email: 'joana@gmailx.com.br')

      # Act / Assert
      expect(customer_two.valid?).to eq false
    end

    it 'falso quando CPF diferente de 11 caracteres' do
      customer = Customer.new(name: 'Joana da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'008464280752', email: 'joana@gmailx.com.br')
      
      customer2 = Customer.new(name: 'João da Silva', address: 'Rua da Mooca, 175', city: 'São Paulo', state: 'SP', cpf:'0084642807', email: 'joana@gmailx.com.br')
      

      # Act / Assert
      expect(customer).not_to be_valid
      expect(customer2).not_to be_valid
    end
  end
end
