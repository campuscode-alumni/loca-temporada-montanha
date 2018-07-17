require 'rails_helper'

feature 'Realtor view property' do
  scenario 'Just view' do
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
    realtor = Realtor.create!(name: 'Dudu', email: 'dudu@mail.com', password: '123456')

    #navegacao
    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'dudu@mail.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Visualizar Propostas'
    
    #expectativa
    expect(page).to have_content('dudu@01.com')
    expect(page).to have_css("h1", text: "#{region.name}")
    expect(page).to have_content("#{property.title}")
    expect(page).to have_content("#{property.property_type.name}")
    expect(page).to have_content("#{property.maximum_guests}")
    expect(page).to have_content("#{property.region.name}")

    expect(page).to have_css("h1", text: "#{region2.name}")
    expect(page).to have_css("h1", text: "#{property2.title}")
    expect(page).to have_content("#{property2.maximum_guests}")
    expect(page).to have_content("#{property2.region.name}")
    
  end

  # scenario 'View owned property' do
  #   #criacao
  #   region = Region.create(name: 'Copacabana')
  #   region2 = Region.create(name: 'Campos')
  #   property_type = PropertyType.create(name: 'Apartamento')
  #   realtor = Realtor.create!(name: 'Dudu', email: 'dudu@mail.com', password: '123456')
  #   realtor2 = Realtor.create!(name: 'Edu', email: 'edu@mail.com', password: '123456')
  #   property = Property.create(title: 'Casa chic', room_quantity: 4 , maximum_guests: 8, minimum_rent: 2,
  #                       maximum_rent: 15, daily_rate: 250.0, property_type: property_type, region: region,
  #                       photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg'))), owner_by: realtor
  #   property2 = Property.create(title: 'Casa pobre', room_quantity: 1 , maximum_guests: 50, minimum_rent: 1,
  #                       maximum_rent: 15, daily_rate: 30.0, property_type: property_type, region: region2,
  #                       photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg'))), owner_by: realtor2                        
    

  #   #navegacao

  #   #expectativa
    
  # end
end