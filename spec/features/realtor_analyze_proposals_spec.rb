require 'rails_helper'

feature 'View all proposal pendent' do
  scenario "Don't have proposals" do

    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'

    click_on 'Log in'

    click_on 'Visualizar Propostas' 
    
    expect(page).to have_css('p', text: 'Nenhuma proposta para este imóvel no momento')
  end


  scenario 'successfully' do
    region = Region.create!(name: 'São Paulo')
    property_type = PropertyType.create!(name: 'Apartamento')
    property = Property.create!(title: 'Casa Chic', 
                    room_quantity: 4, 
                    maximum_guests: 5, 
                    minimum_rent: 2, 
                    maximum_rent: 15,
                    daily_rate: 150.00,
                    property_type: property_type,
                    region: region,
                    photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')))
    proposal = Proposal.create!(start_date: '2018-01-01',
                               end_date: '2018-01-30',
                               total_amount: 200.00,
                               total_guests: 4,
                               guest_name: 'Eduardo Koch',
                               email: 'eduzinho@gmail.com',
                               phone: '33650800',
                               rent_purpose: 100.00,
                               pet: true,
                               smoker: true,
                               details: 'Muito bom',
                               property: property)
                               
    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Visualizar Propostas'
    
    expect(page).to have_content('Eduardo Koch')
  end
=======
>>>>>>> 495bdecaba7179bcabb984b0a8778d03d3d283df
end