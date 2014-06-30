require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  scenario 'user can view manufacturers' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit manufacturers_path

    expect(page).to have_content manufacturer.name
  end
end
