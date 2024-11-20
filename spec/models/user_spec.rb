# require 'rails_helper'    # Pruebas para el ejercicio 1

# RSpec.describe User, type: :model do
  # Validaciones
#  it 'Es valido con atributos' do
#    user = User.new(name: 'Juan', email: 'juan@example.com')
#    expect(user).to be_valid
#  end

#  it 'No es valido sin un nombre' do
#    user = User.new(name: nil, email: 'juan@example.com')
#    expect(user).to_not be_valid
#  end

#  it 'No es valido sin un mail' do
#    user = User.new(name: 'Juan', email: nil)
#    expect(user).to_not be_valid
#  end

#  it 'No es valido si el email esta duplicado' do
#    user1 = User.create(name: 'Juan', email: 'juan@example.com')
#    user2 = User.new(name: 'Pedro', email: 'juan@example.com')
#    expect(user2).to_not be_valid
#  end

#  it 'Es valido con un emial unico' do
#    user1 = User.create(name: 'Juan', email: 'juan@example.com')
#    user2 = User.new(name: 'Pedro', email: 'pedro@example.com')
#    expect(user2).to be_valid
#  end
# end

require 'rails_helper'

RSpec.describe User, type: :model do
  # Validaciones existentes
  it 'is valid with valid attributes' do
    user = User.new(name: 'Juan', email: 'juan@gmail.com')  # Correo válido de Gmail
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil, email: 'juan@gmail.com')
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.new(name: 'Juan', email: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    user1 = User.create(name: 'Juan', email: 'juan@gmail.com')  # Crear primer usuario
    user2 = User.new(name: 'Pedro', email: 'juan@gmail.com')  # Intentar crear otro con el mismo correo
    expect(user2).to_not be_valid
  end

  it 'is valid with a unique email' do
    user1 = User.create(name: 'Juan', email: 'juan@gmail.com')  # Crear primer usuario
    user2 = User.new(name: 'Pedro', email: 'pedro@gmail.com')  # Usar correo único de Gmail
    expect(user2).to be_valid
  end

  # Validación personalizada para el dominio del correo electrónico
  it 'is invalid if email is not from gmail.com' do
    user = User.new(name: 'Juan', email: 'juan@yahoo.com')  # Correo no válido de otro dominio
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include('must be a Gmail address')
  end

  it 'is valid if email is from gmail.com' do
    user = User.new(name: 'Juan', email: 'juan@gmail.com')  # Correo válido de Gmail
    expect(user).to be_valid
  end
end
