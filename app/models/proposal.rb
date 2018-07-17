class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :start_date, :end_date, :total_guests, :guest_name, 
            :email, :phone, :rent_purpose, 
            presence: true
end
