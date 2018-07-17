require 'rails_helper'

feature 'Realtor authentication' do
  scenario 'successfully' do
    realtor = Realtor.create!(name: 'Éduardo Koch',
                              email: 'kochs@01.com',
                              password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('kochs@01.com')
    expect(page).not_to have_link('Login Corretor')
  end
<<<<<<< HEAD

  scenario 'Realtor not access session authentication' do
    visit root_path
    click_on 'Login Corretor'

    fill_in 'Email', with: 'kochss@01.com' 
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Login Corretor')
  end
=======
>>>>>>> 495bdecaba7179bcabb984b0a8778d03d3d283df
end