require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  let(:user1) { create(:user1) }

  context 'User can see transactions' do
    scenario 'Select all transactions' do
      visit new_session_path
      fill_in 'session[name]', with: user1.name
      fill_in 'session[password]', with: user1.password
      click_button 'Log in'
      click_link 'All my transactions'
      expect(page).to have_content('My transactions')
    end
    scenario 'Select all external transactions' do
      visit new_session_path
      fill_in 'session[name]', with: user1.name
      fill_in 'session[password]', with: user1.password
      click_button 'Log in'
      click_link 'All my external transactions'
      expect(page).to have_content('My external transactions')
    end
  end
end
