require 'rails_helper'

feature 'I18N texts' do
  scenario 'devise' do
    #Navegar
    visit root_path
    click_on 'Entrar como Usuário'

    #Expectativa
    expect(page).not_to have_content('Sign up')
    expect(page).not_to have_content('Forgot your password?')
  end

end