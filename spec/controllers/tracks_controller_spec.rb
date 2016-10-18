require 'rails_helper'

describe TracksController, type: :controller do
  let!(:track) { create(:track) }

  describe "GET #index" do
    it "has http status of 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "populates an array of tracks" do
      get :index
      expect(assigns(:tracks)).to eq([track])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "DESTROY #delete" do
    it "deletes the track" do
      expect{
        delete :destroy, id: track
      }.to change(Track,:count).by(-1)
    end

    it "redirects to tracks#index" do
      delete :destroy, id: track
      expect(response).to redirect_to(tracks_path)
    end
  end
end