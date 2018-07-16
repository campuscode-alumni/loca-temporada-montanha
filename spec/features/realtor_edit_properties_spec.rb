require 'rails_helper'

feature 'reltor edit property' do
  scenario 'successfully' do 
    
    property_type = PropertyType.create!(name: 'Apartamento')
    region = Region.create!(name: 'São Paulo')
    property = Property.create!(title: 'Apartamento frente ao mar', room_quantity: 3,
                              maximum_rent: 30, minimum_rent: 2, maximum_guests: 20,
                              daily_rate: 150.00, property_type: property_type,
                              region: region, photo: File.new(Rails.root.join('spec', 'support', 'apartamento.jpg')))

    realtor = Realtor.create!(name: 'Marcos Vieira', email: 'marcos@gmail.com', password: '1234567')

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'marcos@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
    click_on 'Visualizar Imóveis'
    click_on "#{property.title}"
    click_on 'Editar'
    fill_in 'Título', with: 'Apartamento Beira Mar'
    click_on 'Salvar'
    property.reload

    expect(page).to have_content('Sair')
    expect(page).to have_content("#{property.title}")
    expect(page).not_to have_content('Login')
    expect(page).to have_content("#{realtor.email}")
  end
end

