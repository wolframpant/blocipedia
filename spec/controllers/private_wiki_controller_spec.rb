require 'rails_helper'

RSpec.describe PrivateWikiController, :type => :controller do

  describe "GET new" do
    xit "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
