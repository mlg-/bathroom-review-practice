# Let's create a review site for Bathrooms

Let's create a Rails app that allows users to review bathrooms. These are the criteria I want my app to satisfy in terms of listing bathrooms.

###Things to think about
- ER Diagram
- What models should we have?
- What is the relationship between them?

###Getting Set up
- ` git clone git@github.com:EliseFitz15/bathroom-review-practice.git`
- Create our databases `rake db:create`
- Take a look at our tests

###App Functionality
- [] A bathroom has to have a location name, address, and city, state, zip. It can optionally have a description.
- [] Visiting the `/bathrooms` path should contain a list of bathrooms.
- [] Visiting the `/bathrooms/new` path should display a form for adding a new bathroom.
- [] If a bathroom is saved I'm redirected to `/bathroom` path, I should see the new bathroom I've added, and if it is not saved I'm left on the `/bathrooms/new` page and displayed an error.
- [] Visiting the `/bathrooms/5` path should show the bathroom details for a bathroom with ID = 5.
- [] Visiting the root path should display a list of all bathrooms.

Once I have this set up I want to give visitors of my app the ability to leave reviews for bathrooms. Specifically I want my app to satisfy the following criteria:

- [] A bathroom can have many reviews. Each review must be for a specific bathroom, contain a rating that is a whole number between 1 - 5, a body, and a timestamp for when they are created.  
- [] Visiting the `/bathrooms/10/reviews/new` path should display a form for creating a new review for a bathroom with ID =  5.
- [] If a review is saved, I'm redirected to the `bathroom/5` path, if it is not saved, I should be left on the new review form page and render errors associated with the review.  
- [] Visiting the `bathrooms/5` path should also include all of the reviews for a bathroom listed below the bathroom information
