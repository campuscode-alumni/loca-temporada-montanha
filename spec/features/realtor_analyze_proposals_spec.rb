require 'rails_helper'

feature 'View all proposal pendent' do
  scenario "Don't have proposals" do

    realtor = Realtor.create!(email: 'realtor@test.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    
    fill_in 'Email', with: 'realtor@test.com'
    fill_in 'Senha', with: '123456'

    click_on 'Log in'

    click_on 'Visualizar Propostas' 
    
    expect(page).to have_css('p', text: 'Nenhuma proposta para este imóvel no momento')
  end

end