require "rails_helper"

feature "Reject Proposals" do 
  scenario 'successfully' do
    #criar
    user = User.create!(name: 'Jose', email:'jose.couves@mail.com', password: 'teste1234',cpf: '123345484')
    realtor = Realtor.create!(name: 'Eu', email: 'eu@mail.com', password: '123456')
    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create!(name: 'Apartamento')
    property = Property.create!(title: 'Casa chic', room_quantity: 4 , maximum_guests: 8, minimum_rent: 2,
                        maximum_rent: 15, daily_rate: 250.0, property_type: property_type, region: region,
                        photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')))
    proposal = Proposal.create!(:property, :user, :start_date, :end_date, :total_guests, :guest_name, 
    :email, :phone, :rent_purpose)
    #navega

    #expectativa
  end
end