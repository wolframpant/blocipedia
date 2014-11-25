require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "premium user sees more options" do
  scenario "premium user sees Private Wikis" do
    user = create(:user, role: 'premium')
    login_as(user, :scope => :user)
    visit root_path
    expect(page).to have_content("Create Private Wiki View Private Wikis")
  end

  scenario "standard user doesn't see Private Wikis" do
    user = create(:user, role: 'standard')
    login_as(user, :scope => :user)
    visit root_path
    expect(page).not_to have_content("Create Private Wiki View Private Wikis")
  end

  scenario "premium user sees 'New Private Wiki' button" do
     user = create(:user, role: 'premium')
    login_as(user, :scope => :user)
    visit wikis_path
    expect(page).to have_content("New Private Wiki")
  end

  scenario "standard user doesn't see 'New Private Wiki' button" do
    user = create(:user, role: 'standard')
    login_as(user, :scope => :user)
    visit wikis_path
    expect(page).not_to have_content("New Private Wiki")
  end 

end
