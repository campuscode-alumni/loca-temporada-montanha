require 'rails_helper'

feature 'Realtor edit Property type' do
  scenario 'Successfully' do
    #cria
    realtor = Realtor.create!(name: 'Marcos Vieira', email: 'marcos@gmail.com', password: '1234567')
    property_type = PropertyType.create!(name: 'Casa')

    #navega
    visit root_path
    click_on 'Entrar como Corretor'

    fill_in 'Email', with: 'marcos@gmail.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Log in'

    click_on 'Visualizar Tipo de Imóvel'
    click_on 'Casa'
    click_on 'Editar'

    fill_in 'Nome', with: 'Apartamento'
    click_on 'Salvar'

    #expectativa
    expect(page).to have_content("Tipo de imóvel atualizado com sucesso")
    expect(page).to have_content("Nome: Apartamento")
  end

  scenario 'and name not uniqueness' do
    #cria
    realtor = Realtor.create!(name: 'Marcos Vieira', email: 'marcos@gmail.com', password: '1234567')
    property_type = PropertyType.create!(name: 'Casa')
    property_type2 = PropertyType.create!(name: 'Apartamento')

    #navega
    visit root_path
    click_on 'Entrar como Corretor'

    fill_in 'Email', with: 'marcos@gmail.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Log in'

    click_on 'Visualizar Tipo de Imóvel'
    click_on 'Casa'
    click_on 'Editar'

    fill_in 'Nome', with: 'Apartamento'
    click_on 'Salvar'

    #Expectativas
    expect(page).to have_content("Tipo de imóvel já cadastrado")
  end
end