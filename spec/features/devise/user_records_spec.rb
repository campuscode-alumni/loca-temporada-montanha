require 'rails_helper'

feature 'User signs up on site' do 
  scenario 'successfully' do
    
    visit root_path
    click_on 'Login Cliente'
    click_on 'Sign up'


    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Nome', with: 'Rafael Abreu'
    fill_in 'Cpf', with: '123.123.123-45'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmaçao de Senha', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('Rafael Abreu')
  end 
end