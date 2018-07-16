require 'rails_helper'

feature 'Realtor authentication' do
  scenario 'successfully' do
    realtor = Realtor.create!(name: 'Éduardo Koch',
                              email: 'kochs@01.com',
                              password: '123456')

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('kochs@01.com')
    expect(page).not_to have_link('Login')
  end

  scenario 'Realtor not access session authentication' do
    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'kochss@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Login')
  end
end