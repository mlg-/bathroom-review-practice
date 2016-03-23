require "rails_helper"

# [] A bathroom must have a name, address, city, state, and zip code. It can optionally have a description
# [] Visiting the `/bathrooms/new` path should display a form for creating a new bathroom.
# [] When adding a new bathroom, if I fill out the form correctly, I should see the page for the newly created bathroom.
# [] When adding a new bathroom, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add bathrooms" do
  scenario "visitor adds new bathroom successfully" do

    visit new_bathroom_path
    expect(page).to have_content "New Bathroom Form"

    fill_in 'Name', with: "Launch Academy"
    fill_in 'Address', with: "33 Harrison Ave"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    fill_in 'Description', with: "5th floor bathrooms are clean but a bit cramped."

    click_button "Add Bathroom"

    expect(page).to have_content "Bathroom added successfully"
    expect(page).to have_content "Launch Academy"
    expect(page).to have_content "5th floor bathrooms are clean but a bit cramped."
  end

  scenario "visitor does not provide proper information for a bathroom" do
    visit new_bathroom_path

    click_button "Add Bathroom"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
end
