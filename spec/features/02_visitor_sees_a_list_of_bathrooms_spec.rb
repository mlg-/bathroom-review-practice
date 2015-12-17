require 'rails_helper'

# [] Visiting the `/bathrooms` path should contain a list of bathrooms.
# [] Visiting the `/bathrooms/10` path should show the bathroom details for a bathroom with the ID of 10.
# [] Visiting the root path should display a list of all bathrooms.

feature "visitor sees a list of bathrooms" do
  scenario "sees a list of bathrooms and link for new bathroom" do
    starbucks = Bathroom.create(name: 'Starbucks', address: '125 Summer St', city: 'Boston', state: 'MA', zip: '02110')
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")

    visit bathrooms_path

    expect(page).to have_content "Starbucks"
    expect(page).to have_link "Launch Academy"

    click_link "Add New Bathroom"

    expect(page).to have_content "New Bathroom Form"
  end

  scenario "clicks link and is taken to show page for given bathroom" do
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")

    visit root_path

    click_link "Launch Academy"

    expect(page).to have_content launch.name
    expect(page).to have_content launch.address
    expect(page).to have_content launch.city
    expect(page).to have_content launch.state
    expect(page).to have_content launch.zip
    expect(page).to have_content launch.description
  end
end
