require "rails_helper"

feature "Reject Proposals" do 
  scenario 'successfully' do
   # criar
   realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')
   region = Region.create!(name: 'São Paulo')
   property_type = PropertyType.create!(name: 'Casa de Praia')
   user = User.create!(
     name: 'Jose',
     email: 'jose.couves@mail.com',
     password: 'teste1234',
     cpf: '123345484'
   )
 
   property = Property.create!(
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
 
   proposal = Proposal.create!(
     user: user,
     property: property,
     start_date: '2018-01-01',
     end_date: '2018-01-10',
     total_guests: 4,
     guest_name: 'José das Couves',
     email: 'jose.couves@mail.com',
     phone: "(11) 3333 8888",
     pet: false,
     smoker: true,
     rent_purpose: 'Férias'
   )
 
    # navegar
    visit root_path
    click_on 'Entrar como Corretor'
 
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
 
    click_on 'Log in'
 
    click_on 'Visualizar Propostas' 
    click_on 'Proposta #1'
    click_on 'Rejeitar!'
 
    #expectativa
    expect(page).to have_content("Proposta foi rejeitada")
    expect(page).to have_css("h1", text: "Propriedade: #{property.title}")
    expect(page).to have_css("h2", text: "Tipo: #{property.property_type.name}")
    expect(page).to have_css("h2", text: "Região: #{property.region.name}")
    expect(page).to have_css("h2", text: "Status: Rejeitada")
    expect(page).to have_css("h2", text: "Proposta ##{proposal.id}")
    expect(page).to have_css("h3", text: "Período: De 01/01/2018 até 10/01/2018")
  end
end