class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :region

  has_attached_file :photo

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/ 
  validates :title, :room_quantity, :maximum_guests, :minimum_rent,
            :maximum_rent, :daily_rate,
            presence: { message: 'não pode ficar em branco' }
  validates :photo, presence: {message: 'A imagem deve ser obrigatória'}
end
