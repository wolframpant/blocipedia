require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature 'user views My Wikis' do
  scenario "allows logged-in user to view Wikis that they've created" do
    # Create user
    user = FactoryGirl.create(:user, :role => 'standard')
    # Create 3 wikis for user
    (1..3).each do |num|
      wiki = create(:wiki, title: "Wiki Title #{num}", users: [user])
    end
    user.relationships.each do |relationship|
      relationship.update!(creator_created: true)
    end
    

    login_as(user, :scope => :user)

    visit mine_path

    expect(page).to have_content("All (Public & Private) Wikis Created by #{user.name}")
    expect(page).to have_content("New Wiki")
    expect(page).to have_content("Wiki Title 1")
    expect(page).to have_content("Wiki Title 2")
    expect(page).to have_content("Wiki Title 3")
  end
end
