require 'rails_helper'

feature 'Register Property Type' do
  scenario 'successfully' do
    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    click_on 'Cadastrar tipo de imóvel'
    fill_in 'Nome', with: 'Apartamento'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Tipo do imóvel cadastrado com sucesso')
    expect(page).to have_css('h1', text: 'Apartamento')
  end

  scenario 'and leave blank fields' do
    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar tipo de imóvel'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
