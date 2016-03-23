require 'rails_helper'

# [] Visiting the `/bathrooms/1/reviews/new` should display a form for creating a new review for a bathroom with ID = 1.
# [] Form should validate all of the review properties and ratings must be between 1 and 5, inclusive. This should be a whole number.

feature "visitors can add reviews for bathrooms" do
  scenario "adds a review for a bathroom successfully" do
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")

    visit new_bathroom_review_path(launch)

    expect(page).to have_content "Review Form for Launch Academy"

    fill_in "Rating", with: 5
    fill_in "Review", with: "This is a raving review!"
    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content launch.name
    expect(page).to have_content 5
    expect(page).to have_content "This is a raving review!"
  end

  scenario "adds a review for a bathroom unsuccessfully" do
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")

    visit bathroom_path(launch)

    click_link "Add a Review"
    expect(page).to have_content "Review Form for Launch Academy"

    fill_in "Rating", with: 8

    click_button "Add Review"

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Rating must be between 1 - 5"
  end
end
