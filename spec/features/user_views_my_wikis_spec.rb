require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature 'user views My Wikis' do
  scenario "allows logged-in user to view Wikis that they've created" do
    # Create user
    user = FactoryGirl.create(:user)
    # Create 3 wikis for user
    wikis = FactoryGirl.create_list(:wiki, 3, users: [user])
    
    login_as(user, :scope => :user)

    visit mine_path

    expect(page).to have_content("All Wikis Created by #{user.name}")
    expect(page).to have_content("New Wiki")
    3.times.expect(page).to have_content("MyString MyText")
  end
end
