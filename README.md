#Let's Create a Review Site for Bathrooms!

Let's create a Rails app that allows users to review bathrooms. These are the criteria I want my app to satisfy in terms of listing bathrooms.

#Things to Think About
- ER Diagram
- What models should we have?
- What is the relationship between them?

##To Pull This Down for Practice
- ` git clone git@github.com:mlg-/bathroom-review-practice.git` or `git clone https://github.com/mlg-/bathroom-review-practice.git`
- Create the databases `rake db:create`
- Run `rake`

##To Pull Down the Solution and Look At It on Your Machine
- `git fetch --all` (this pulls down all the remote branches on GitHub for this repo)
- `git checkout live-solution` (this checks out the live solution of the code)

You can also view all the stuff we added/changed on Github [here](https://github.com/mlg-/bathroom-review-practice/pull/2/files).

##App Functionality
- [] A bathroom has to have a location name, address, and city, state, zip. It can optionally have a description.
- [] Visiting the `/bathrooms` path should contain a list of bathrooms.
- [] Visiting the `/bathrooms/new` path should display a form for adding a new bathroom.
- [] If a bathroom is saved I'm redirected to `/bathroom/5` path, I should see the new bathroom I've added, and if it is not saved I'm left on the `/bathrooms/new` page and displayed an error.
- [] Visiting the `/bathrooms/5` path should show the bathroom details for a bathroom with ID = 5.
- [] Visiting the root path should display a list of all bathrooms.

Once I have this set up I want to give visitors of my app the ability to leave reviews for bathrooms. Specifically I want my app to satisfy the following criteria:

- [] A bathroom can have many reviews. Each review must be for a specific bathroom, contain a rating that is a whole number between 1 - 5, a body, and a timestamp for when they are created.  
- [] Visiting the `/bathrooms/10/reviews/new` path should display a form for creating a new review for a bathroom with ID =  5.
- [] If a review is saved, I'm redirected to the `bathroom/5` path, if it is not saved, I should be left on the new review form page and render errors associated with the review.  
- [] Visiting the `bathrooms/5` path should also include all of the reviews for a bathroom listed below the bathroom information
