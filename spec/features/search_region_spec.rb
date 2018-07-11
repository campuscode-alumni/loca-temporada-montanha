require 'rails_helper'

feature 'Search by region' do
  scenario 'successfully' do
    #criar  
    region = Region.create(name: 'Copacabana')
    region2 = Region.create(name: 'Campos')
    property_type = PropertyType.create(name: 'Apartamento')
    property = Property.create(title: 'Casa chic', room_quantity: 4 , maximum_guests: 8, minimum_rent: 2,
                        maximum_rent: 15, daily_rate: 250.0, property_type: property_type, region: region)
    property2 = Property.create(title: 'Casa pobre', room_quantity: 1 , maximum_guests: 50, minimum_rent: 1,
                        maximum_rent: 15, daily_rate: 30.0, property_type: property_type, region: region2)                        
    
    #navegar
    visit root_path
    select 'Copacabana', from: 'Região'
    click_on 'Buscar'

    #expectativa
    expect(page).to have_css("h1", text: "#{region.name}")
    expect(page).to have_content("#{property.title}")
    expect(page).to have_content("#{property.property_type.name}")
    expect(page).to have_content("#{property.maximum_guests}")
    expect(page).to have_content("#{property.region.name}")

    expect(page).not_to have_css("h1", text: "#{region2.name}")
    expect(page).not_to have_css("h1", text: "#{property2.title}")
    expect(page).not_to have_content("#{property2.maximum_guests}")
    expect(page).not_to have_content("#{property2.region.name}")
  end

  scenario 'unsuccessfully' do
    #criar  
    region = Region.create(name: 'Copacabana')

    #navegar
    visit root_path
    select 'Copacabana', from: 'Região'
    click_on 'Buscar'

    #expectativa
    expect(page).to have_css("h1", text: "#{region.name}")
    expect(page).to have_content("Região #{region.name} sem propriedades ainda!")

  end
end
