require 'rails_helper'

feature 'realtor added photos' do
  scenario 'successfully' do
    PropertyType.create(name: 'Apartamento')
    Region.create(name: 'São Paulo')

    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar imóvel'
    fill_in 'Título', with: 'Apartamento São Paulo'
    select 'Apartamento', from: 'Tipo do imóvel'
    fill_in 'Quantidade de cômodos', with: '2'
    fill_in 'Quantidade de cômodos', with: '2'
    fill_in 'Ocupação máxima', with: '4'
    fill_in 'Mínimo de diárias', with: '2'
    fill_in 'Máximo de diárias', with: '15'
    fill_in 'Valor da diária', with: '1500.00'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'casa.jpg')
    click_on 'Cadastrar'

    expect(page).to have_content('Imóvel cadastrada com sucesso')
    expect(page).to have_css('h1', text: 'Apartamento São Paulo')
    expect(page).to have_css("img[src*='casa.jpg']")

  end

  scenario ' and must add photo' do
    PropertyType.create(name: 'Apartamento')
    Region.create(name: 'São Paulo')

    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar imóvel'
    fill_in 'Título', with: 'Apartamento São Paulo'
    select 'Apartamento', from: 'Tipo do imóvel'
    fill_in 'Quantidade de cômodos', with: '2'
    fill_in 'Quantidade de cômodos', with: '2'
    fill_in 'Ocupação máxima', with: '4'
    fill_in 'Mínimo de diárias', with: '2'
    fill_in 'Máximo de diárias', with: '15'
    fill_in 'Valor da diária', with: '1500.00'
    click_on 'Cadastrar'

    expect(page).to have_content('A imagem deve ser obrigatória')
  end
end
