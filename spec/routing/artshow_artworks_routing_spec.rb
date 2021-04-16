require "rails_helper"

RSpec.describe ArtshowArtworksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artshow_artworks").to route_to("artshow_artworks#index")
    end

    it "routes to #show" do
      expect(get: "/artshow_artworks/1").to route_to("artshow_artworks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artshow_artworks").to route_to("artshow_artworks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artshow_artworks/1").to route_to("artshow_artworks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artshow_artworks/1").to route_to("artshow_artworks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artshow_artworks/1").to route_to("artshow_artworks#destroy", id: "1")
    end
  end
end
