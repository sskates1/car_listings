require 'rails_helper'

feature 'user adds a new manufacturer', %Q(
  As a user
  I want to add a new manufacturer I found.
) do

  scenario 'user can add a food manufacturer' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content manufacturer.name
  end

  scenario 'user tries to add a blank food manufacturer' do
    visit new_manufacturer_path
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Country can't be blank"
  end
end
