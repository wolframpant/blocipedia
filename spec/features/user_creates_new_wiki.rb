require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature "User creates new Wiki" do
  scenario "allows logged-in user to create new Wiki" do
    user = FactoryGirl.create(:user)
    wiki = FactoryGirl.create(:wiki)
      login_as(user, :scope => :user)
      visit new_wiki_path
      fill_in 'Title', with: 'My bio'
      fill_in 'Body', with: 'This is my life story.'
      click_button 'Save'
  end
end
