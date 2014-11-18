require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature "User creates new Wiki" do
  scenario "allows logged-in user to create new Wiki" do
    user = create(:user)
    wiki = create(:wiki)
      login_as(user, :scope => :user)
      visit new_wiki_path
      fill_in 'Title', with: 'My bio'
      fill_in 'Body', with: 'This is my life story.'
      click_button 'Save'
      expect(page).to have_content "Your new Wiki was saved."
  end
end
