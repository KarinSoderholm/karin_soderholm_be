require "rails_helper"

RSpec.describe ArtistStatementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artist_statements").to route_to("artist_statements#index")
    end

    it "routes to #show" do
      expect(get: "/artist_statements/1").to route_to("artist_statements#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artist_statements").to route_to("artist_statements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artist_statements/1").to route_to("artist_statements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artist_statements/1").to route_to("artist_statements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artist_statements/1").to route_to("artist_statements#destroy", id: "1")
    end
  end
end
