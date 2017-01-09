require "rails_helper"

RSpec.feature "creating home page" do
	scenario do
		visit visit '/'
		
		expect(page).to have_content("Athelets Den")
		expect(page).to have_content("Home")
		expect(page).to have_content("Workout Lounge")
	end
end