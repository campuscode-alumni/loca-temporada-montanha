require 'rails_helper'

feature 'Register Property Type' do
  scenario 'successfully' do
<<<<<<< HEAD
    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

=======
    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
>>>>>>> 495bdecaba7179bcabb984b0a8778d03d3d283df
    click_on 'Cadastrar tipo de imóvel'
    fill_in 'Nome', with: 'Apartamento'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Tipo do imóvel cadastrado com sucesso')
    expect(page).to have_css('h1', text: 'Apartamento')
  end

  scenario 'and leave blank fields' do
<<<<<<< HEAD
    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Login Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
=======
    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
>>>>>>> 495bdecaba7179bcabb984b0a8778d03d3d283df
    click_on 'Cadastrar tipo de imóvel'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
