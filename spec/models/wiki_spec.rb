require 'rails_helper'

RSpec.describe Wiki, :type => :model do

  context "associations" do
    it "should have many users through relationships", focus: true do
      expect(Wiki.new).to have_many(:users)
    end
  end

  context "validations" do
    # expect(Wiki.new).to validate
  end

end
