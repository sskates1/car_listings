require 'rails_helper'

feature 'user adds a new car', %Q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
) do

  scenario 'user can add a car' do
    car = FactoryGirl.build(:car)

    visit new_car_path

    fill_in 'Model', with: car.model
    fill_in 'Mileage', with: car.mileage
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Description', with: car.description
    select(car.manufacturer.name, from: "Manufacturer")
    click_on 'Submit'

    expect(page).to have_content car.model
  end

  scenario 'user tries to add a blank car' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_car_path
    click_on 'Submit'

    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Year is not a number"
    expect(page).to have_content "Mileage can't be blank"
    expect(page).to have_content "Mileage can't be blank"
  end
  scenario 'user tries to add a car with a year before 1920' do
    car = FactoryGirl.build(:car)

    visit new_car_path

    fill_in 'Year', with: "1900"
    click_on 'Submit'

    expect(page).to have_content "Year must be greater than or equal to 1920"
  end

  scenario 'user tries to add a car with a milage with negative mileage' do
    car = FactoryGirl.build(:car)

    visit new_car_path

    fill_in 'Mileage', with: "-1"
    click_on 'Submit'

    expect(page).to have_content "Mileage must be greater than or equal to 0"
  end
end
