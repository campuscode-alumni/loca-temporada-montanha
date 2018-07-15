require 'rails_helper'

feature 'Realtor view property' do
  scenario 'successfully' do
    #criacao
    region = Region.create(name: 'Copacabana')
    region2 = Region.create(name: 'Campos')
    property_type = PropertyType.create(name: 'Apartamento')
    property = Property.create(title: 'Casa chic', room_quantity: 4 , maximum_guests: 8, minimum_rent: 2,
                        maximum_rent: 15, daily_rate: 250.0, property_type: property_type, region: region,
                        photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')))
    property2 = Property.create(title: 'Casa pobre', room_quantity: 1 , maximum_guests: 50, minimum_rent: 1,
                        maximum_rent: 15, daily_rate: 30.0, property_type: property_type, region: region2,
                        photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')))                        
    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    #navegacao
    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    click_on 'Minhas Propriedades'

    
    
    #expectativa
    expect(page).to have_content('kochs@01.com')
    
  end

  
end