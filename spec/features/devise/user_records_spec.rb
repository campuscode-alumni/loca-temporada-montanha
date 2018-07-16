require 'rails_helper'

feature 'User signs up on site' do 
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com',
                        name: 'Rafael Abreu',
                        cpf: '123.123.123-45',
                        password: '123456',
                        password_confirmation: '123456')
    
    visit root_path
    click_on 'Sign up'

    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Name', with: 'Rafael Abreu'
    fill_in 'cpf', with: '123.123.123-45'

    click_on 'Enviar'

    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('Rafael Abreu')
  end 
end