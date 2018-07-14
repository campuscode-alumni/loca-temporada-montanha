class Proposal < ApplicationRecord
  belongs_to :property
  validates :start_date, :end_date, :total_guests, :guest_name, 
            :email, :phone, :pet, :smoker, :rent_purpose, 
            presence: true
end
