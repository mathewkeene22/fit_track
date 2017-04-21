require 'rails_helper'

RSpec.feature 'Listing Exercises' do

  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: 'running', workout_date: '2015-04-21')
    @e2 = @john.exercises.create(duration_in_min: 20, workout: 'cycling', workout_date: '2015-04-22')
  end

  scenario 'shows user workouts within the last 7 days' do
    visit '/'

    click_link 'My Lounge'
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e2.workout)
  end
end