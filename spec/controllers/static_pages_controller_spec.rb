require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      assert_select "title", "Home"
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      assert_select "title", "Help"

    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      assert_select "title", "About"

    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
      assert_select "title", "Contact"
    end
  end
end