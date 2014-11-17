require 'rails_helper'

RSpec.describe User, :type => :model do

  context "associations" do
    it "should have many users through relationships", focus: true do
      expect(User.new).to have_many(:wikis)
    end
  end

  
end
