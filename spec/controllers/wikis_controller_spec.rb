require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe WikisController, :type => :controller do
  
  describe "GET index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      wiki=create(:wiki)
      get :show, id: wiki.id
      expect(response).to have_http_status(:success)
    end
    it "assigns the correct wiki to the view" do
      wiki1 = create(:wiki)
      wiki2 = create(:wiki)
      get :show, id: wiki2.id
      expect(assigns(:wiki)).to eq(wiki2)
      expect(assigns(:wiki)).not_to eq(wiki1)
    end
  end

  describe "GET new" do
    xit "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    xit "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    xit "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
