require 'rails_helper'

feature 'Realtor edit region' do
  scenario 'Successfully' do
    realtor = Realtor.create!(name: 'Marcos Vieira', email: 'marcos@gmail.com', password: '1234567')
    region = Region.create!(name: 'São Paulo')

    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Visualizar Regiões'
    click_on "#{region.name}"
    click_on 'Editar'
    fill_in 'Título', with: 'São Paulo/SP'
    click_on 'Salvar'
    region.reload

    expect(page).to have_content('Sair')
    expect(page).to have_content("#{region.name}")
    expect(page).not_to have_content('Login')
    expect(page).to have_content("#{realtor.email}")
    expect(page).to have_content("Região Atualizada com Sucesso")
  end
end 