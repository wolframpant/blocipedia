require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers

feature "Premium Users have access" do
  scenario "it allows premium users to create private wikis" do
    user = create(:user, role: 'premium')
    login_as(user, :scope => :user)
    visit root_path
    click_on "Create Private Wiki"
    expect(page).to have_content("Private Wiki")
    fill_in('Title', with: 'Here is my Title')
    fill_in('Body', with: 'This is the body.')
    click_on('Save and Parse')
    expect(page).to have_content('This is the body.')
  end

  scenario "it allows premium users to edit Private Wikis" do
    wiki = create(:wiki, personal: true)
    user = create(:user, role: 'premium')
    r = create(:relationship, wiki_id: wiki.id, user_id: user.id, creator_created: true)
    login_as(user, :scope => :user)
    visit root_path
    click_on('View Private Wikis')
    click_on('MyString')
    click_on('Edit')
    click_button('Save and Parse')
    expect(page).to have_content('MyString')
  end

  scenario "it allows premium users to assign collaborators" do
    user = create(:user, role: 'premium')
    wiki = create(:wiki, personal: true)
    r = create(:relationship, wiki_id: wiki.id, user_id: user.id, creator_created: true)
    login_as(user, :scope => :user)
    visit (edit_wiki_path(wiki))
    expect(page).to have_content('Private')
    expect(page).to have_content("Select collaborators")
  end

  scenario "it doesn't allow standard users to edit Private Wikis" do
    user = create(:user, role: 'standard')
    wiki = create(:wiki, personal: true)
    login_as(user, :scope => :user)
    visit (edit_wiki_path(wiki))
    expect(page).to have_content("Blocipedia is a resource for creating and maintaining user wikis")
  end

end
