require 'rails_helper'

RSpec.describe User, :type => :model do

  context "associations" do
    it "should have many users through relationships", focus: true do
      expect(User.new).to have_many(:wikis)
    end
  end

  context "#admin?" do
    it "returns true when role is admin" do
      user = User.new(role: 'admin')
      expect(user.admin?).to eq(true)
    end
    it "returns false when role is not admin" do
      user = User.new(role: 'standard')
      expect(user.admin?).to eq(false)
    end
  end

  context "standard?" do
    it "returns true when role is standard" do
      user = User.new(role: 'standard')
      expect(user.standard?).to eq(true)
    end
    it "returns false when role is not standard" do
      user = User.new(role: 'admin')
      expect(user.standard?).to eq(false)
    end
  end

  context "premium?" do
    it "returns true when role is premium" do
      user = User.new(role: 'premium')
      expect(user.premium?).to eq(true)
    end
    it "returns false when role is not premium" do
      user = User.new(role: 'admin')
      expect(user.premium?).to eq(false)
    end
  end

end
