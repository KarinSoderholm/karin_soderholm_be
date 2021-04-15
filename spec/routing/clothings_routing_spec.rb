require "rails_helper"

RSpec.describe ClothingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/clothings").to route_to("clothings#index")
    end

    it "routes to #show" do
      expect(get: "/clothings/1").to route_to("clothings#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/clothings").to route_to("clothings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/clothings/1").to route_to("clothings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/clothings/1").to route_to("clothings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/clothings/1").to route_to("clothings#destroy", id: "1")
    end
  end
end
