require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature 'user views My Wikis' do
  scenario "allows logged-in user to view Wikis that they've created" do
    user = FactoryGirl.create(:user)
    wiki1 = FactoryGirl.create(:wiki)
    wiki2 = FactoryGirl.create(:wiki)
    wiki3 = FactoryGirl.create(:wiki)
    wiki4 = FactoryGirl.create(:wiki_with_users, users: [user])
    puts "-"*30
    puts wiki4
    raise "Hello"
    
    login_as(user, :scope => :user)

    visit mine_path

    expect(page).to have_content("All Wikis Created by")
    expect(page).to have_content("New Wiki")
    # expect(page).to have_content("MyString MyText")
  end
end
