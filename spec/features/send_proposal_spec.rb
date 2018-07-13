require 'rails_helper'

feature 'Send Proposal' do
  scenario 'successfully' do
    #criar
    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Apartamento')
    property = Property.create(title: 'Casa chic', room_quantity: 4 , maximum_guests: 8, minimum_rent: 2,
                        maximum_rent: 15, daily_rate: 250.0, property_type: property_type, region: region,
                        photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')))
    #navegar
    visit root_path
    select 'Copacabana', from: 'Região'
    click_on 'Buscar'
    click_on "#{property.name}"
    click_on 'Fazer proposta'

    fill_in "Data de Chegada", with: "11/11/2018"
    fill_in "Data de Saida", with: "14/11/2018"
    
    select "2", from "Número de Hóspedes"  
    fill_in "Nome do proponente", with: "Tio chato"
    fill_in "email", with: "tio@mail.com"
    fill_in "Telfone", with: "1144446666"
    fill_in "Finalidade da proposta", with: "Casamento"
    check "Tem pet ?"
    check "Tem Fumantes ?"
    fill_in "Mais Detalhes", with: " Casamento gay"
    click_on 'Enviar Proposta'

    #expectativa
    expect(page).to have_content('Proposta enviada com sucesso')
    expect(page).to have_content("Proposta para #{property.name}")
    expect(page).to have_content('h1', 'Feita por:')
    expect(page).to have_css('h2', "Tio chato")
    expect(page).to have_css('h2', "tio@mail.com")
    expect(page).to have_css('h3', 'Casamento gay')
    expect(page).not_to have_content('Enviar Proposta')

  end

end