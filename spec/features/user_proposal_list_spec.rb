require 'rails_helper'

feature 'Search by region' do
  scenario 'successfully' do
    #criar
    realtor = Realtor.create!(name: 'Marcos Vieira', email: 'marcos@gmail.com', password: '1234567')
    current_user = User.create!(
      name: 'Jose',
      email: 'jose.couves@mail.com',
      password: 'teste1234',
      cpf: '123345484'
    )

    region = Region.create(name: 'Copacabana')

    property_type = PropertyType.create(name: 'Apartamento')

    property = Property.create(
      title: 'Casa chic', room_quantity: 4 ,
      maximum_guests: 8,
      minimum_rent: 2,
      maximum_rent: 15,
      daily_rate: 250.0,
      property_type: property_type,
      region: region,
      photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')),
      realtor: realtor
     )

    proposal = Proposal.create(
      user: current_user,
      property: property,
      start_date: Date.current.to_s,
      end_date: (Date.current + 5.days).to_s,
      total_guests: 4,
      guest_name: 'José das Couves',
      email: 'jose.couves@mail.com',
      phone: "(11) 3333 8888",
      pet: false,
      smoker: true,
      rent_purpose: 'Férias'
    )

    #navegar
    visit root_path
    click_on 'Entrar como Usuário'
    fill_in 'Email', with: 'jose.couves@mail.com'
    fill_in 'Senha', with: 'teste1234'
    click_on 'Log in'
    click_on 'Visualizar Propostas'

    #expectativa
    expect(page).to have_css("h2", text: "#{region.name}")
    expect(page).to have_css("h1", text: "#{property.title}")
    expect(page).to have_content("#{proposal.rent_purpose}")
  end
end
