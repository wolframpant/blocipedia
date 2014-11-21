require 'rails_helper'

RSpec.describe User, :type => :model do

  context "associations" do
    it "should have many users through relationships", focus: true do
      expect(User.new).to have_many(:wikis)
    end
  end

  context "standard" do
    it "should be able to see 'View My Wikis" do
      user = create(:user, role: "standard")
      visit root_path
      expect(page).to have_content "View My Wikis"
    end
  end

  context "premium" do
    it "should be able to see 'View Private Wikis'" do
      user = create(:user, role: "premium")
      visit root_path
      expect(page).to have_content "View Private Wikis"
    end
  end
end
