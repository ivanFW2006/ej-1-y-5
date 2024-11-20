#class User < ApplicationRecord   # archivo para ejercicio 1
  # Validaciones
#  validates :name, presence: true
#  validates :email, presence: true, uniqueness: true
#end 

class User < ApplicationRecord   # archivo para ejercicio 2
  # Validaciones
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Validación personalizada
  validate :email_domain_is_gmail

  private

  # Método que valida que el dominio del correo sea @gmail.com
  def email_domain_is_gmail
    unless email =~ /\A[A-Za-z0-9._%+-]+@gmail\.com\z/
      errors.add(:email, 'must be a Gmail address')
    end
  end
end
