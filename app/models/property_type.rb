class PropertyType < ApplicationRecord
  has_many :properties

  validates :name, presence: { message: 'não pode ficar em branco' }
  validates :name, uniqueness: { case_sensitive: false,
                                message: 'Tipo de imóvel já cadastrado'}
end
