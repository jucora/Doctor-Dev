require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do

	let(:user1) { create(:user1) }

	context 'User sign in' do
		scenario 'Correct user sign in' do
			visit new_session_path
			fill_in 'session[name]', with: user1.name
			fill_in 'session[password]', with: user1.password
			click_button 'Log in'
			expect(page).to have_content("Welcome #{user1.name}")
		end

		scenario 'Incorrect user sign in' do
			user1.password = 'different_password'
			visit new_session_path
			fill_in 'session[name]', with: user1.name
			fill_in 'session[password]', with: user1.password
			click_button 'Log in'
			expect(page).to have_content("Wrong user or password")
		end
	end
end