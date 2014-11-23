require 'rails_helper'

RSpec.describe Wiki, :type => :model do

  context "associations" do
    it "should have many users through relationships", focus: true do
      expect(Wiki.new).to have_many(:users)
    end
  end

  context "validations" do
    it 'should validate the presence of a title and a body in each wiki' do
      expect(Wiki.new).to validate_presence_of :title
      expect(Wiki.new).to validate_presence_of :body
    end
  end

  context "personal?" do
    it "should indicate whether a wiki is personal/private" do
      wiki = Wiki.new(personal: true)
      expect(wiki.personal?).to eq(true)
    end
  end

  context "personal?" do
    it "should indicate whether a wiki is personal/private" do
      wiki = Wiki.new(personal: false)
      expect(wiki.personal?).to eq(false)
    end
  end
  
end
