require 'rails_helper'

RSpec.feature 'User', type: :feature do
  let!(:user1) { build(:user1) }
  let!(:user2) { build(:user2) }
  let!(:user3) { build(:user3) }
  context 'User sign up' do
    scenario 'Correct user sign up' do
      visit new_user_path
      fill_in 'Name', with: user1.name
      fill_in 'user[password]', with: user1.password
      fill_in 'user[password_confirmation]', with: user1.password_confirmation
      click_button 'Sign up'
      expect(page).to have_content("Welcome #{user1.name}")
    end
    scenario 'Incorrect user sign up when name is empty' do
      visit new_user_path
      fill_in 'Name', with: ''
      fill_in 'user[password]', with: user1.password
      fill_in 'user[password_confirmation]', with: user1.password_confirmation
      click_button 'Sign up'
      expect(page).to have_content("Name can't be blank")
    end
    scenario 'Incorrect user sign up when password confirmation does not match password' do
      visit new_user_path
      fill_in 'Name', with: user2.name
      fill_in 'user[password]', with: user2.password
      fill_in 'user[password_confirmation]', with: user2.password_confirmation
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
    scenario 'Incorrect user sign up when name already exists' do
      user1.save
      visit new_user_path
      fill_in 'Name', with: user3.name
      fill_in 'user[password]', with: user3.password
      fill_in 'user[password_confirmation]', with: user3.password_confirmation
      click_button 'Sign up'
      expect(page).to have_content('Name has already been taken')
    end
  end
end
