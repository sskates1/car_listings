require 'rails_helper'

feature 'user adds a new manufacturer', %Q(
  As a user
  I want to add a new manufacturer I found.
) do

  scenario 'user can add a manufacturer' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content manufacturer.name
    expect(page).to have_content "Your manufacturer  was succesfully entered"
  end

  scenario 'user tries to add a blank manufacturer' do
    visit new_manufacturer_path
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Country can't be blank"
  end

  scenario 'user tries to add a manufacturer already in database' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content "has already been taken"
    expect(page).to_not have_content "Your manufacturer  was successfully entered"
  end
end
