require 'rails_helper'

# [] A bathroom can have many reviews. Each review must contain the following:
#   [] A rating
#   [] A body
#   [] A timestamp for when it was created
# [] Visiting the `/bathrooms/1` path should also include all reviews for a bathroom with ID = 1.

feature "visitor sees list of reviews on bathroom page" do
  scenario "sees reviews for specific bathroom" do
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")
    review_for_launch = Review.create(rating: 4, body: "This is a slightly less than rave review", bathroom: launch)

    visit bathroom_path(launch)

    expect(page).to have_content launch.name
    expect(page).to have_content review_for_launch.rating
    expect(page).to have_content review_for_launch.body
    expect(page).to have_content review_for_launch.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other reviews for other bathrooms" do
    launch = Bathroom.create(name: "Launch Academy", address: "33 Harrison Ave", city: "Boston", state: "MA", zip: "02111")
    review_for_launch = Review.create(rating: 3, body: "This is a slightly less than rave review", bathroom: launch)

    starbucks = Bathroom.create(name: 'Starbucks', address: '125 Summer St', city: 'Boston', state: 'MA', zip: '02110')
    review_for_starbucks = Review.create(rating: 2, body: "Super sketch", bathroom: starbucks)

    visit bathroom_path(starbucks)

    expect(page).to have_content starbucks.name
    expect(page).to have_content review_for_starbucks.body

    expect(page).not_to have_content review_for_launch.rating
    expect(page).not_to have_content review_for_launch.body
  end
end
