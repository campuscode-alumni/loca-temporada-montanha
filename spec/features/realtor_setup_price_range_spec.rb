require 'rails_helper'

feature 'setup price range' do
  scenario 'create a price range' do
  #criar
  realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')
  region = Region.create!(name: 'São Paulo')
  property_type = PropertyType.create!(name: 'Casa de Praia')
  property = Property.create!(title: 'Casa chic', room_quantity: 4 ,
                              maximum_guests: 8,minimum_rent: 2,maximum_rent: 15, 
                              daily_rate: 250.0,property_type: property_type,region: region,
                              photo: File.new(Rails.root.join('spec', 'support', 'casa.jpg')),
                              realtor: realtor)  
  #navegar
  visit root_path

  click_on 'Entrar como Corretor'
  fill_in 'Email', with: 'realtor@test.com'
  fill_in 'Senha', with: '123456'
  click_on 'Log in'

  click_on 'Preço por Temporada'  
  click_on 'Cadastrar Temporada'
  fill_in 'Título', with: 'Carnaval'
  fill_in 'Início do Período', with: '01/02/2019'
  fill_in 'Término do Período', with: '15/02/2019'
  fill_in 'Preço', with: '300,00'

  #expectativa
  expect(page).to have_content('Titulo: Carnaval')
  expect(page).to have_content('Início do Período: 01-02-2019')
  expect(page).to have_content('Término do Perído: 15-02-2019')
  expect(page).to have_content('Valor Padrão: R$ 250,00')
  expect(page).to have_content('Valor Temporada: R$ 300,00')
  end
end