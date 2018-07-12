require 'rails_helper'

feature 'View all proposal pendent' do
  scenario "Don't have proposals" do
    visit root_path
    click_on 'Visualizar Propostas' 
    
    expect(page).to have_css('p', text: 'Nenhuma proposta para este imóvel no momento')
  end
end