require "rails_helper"

describe "creating exercise" do
	before do
		@john = User.create(email: "john@test.com", password: "password")
		login_as(@john)
	end

	scenario "with valid inputs" do
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"

		expect(page).to have_link("Cancel")

		fill_in "Duration", with: "60"
		fill_in "Workout Details", with: "Running"
		fill_in "Date", with: "2017-01-15"

		click_button "Create Exercise"

		expect(page).to have_content("Exercise has been created.")
		exercise = Exercise.last
		expect(page.current_path).to eq(user_exercise_path(@john, exercise))
	end

	scenario "with invalid inputs" do
		visit "/"

		click_link "My Lounge"
		click_link "New Workout"

		expect(page).to have_link("Cancel")

		fill_in "Duration", with: ""
		fill_in "Workout Details", with: ""
		fill_in "Date", with: ""

		click_button "Create Exercise"

		expect(page).to have_content("Duration in min can't be blank")
		expect(page).to have_content("Duration in min is not a number")
		expect(page).to have_content("Workout date can't be blank")
		expect(page).to have_content("Workout can't be blank")
	end
end