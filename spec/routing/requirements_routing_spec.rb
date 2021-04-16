require "rails_helper"

RSpec.describe RequirementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/requirements").to route_to("requirements#index")
    end

    it "routes to #show" do
      expect(get: "/requirements/1").to route_to("requirements#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/requirements").to route_to("requirements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/requirements/1").to route_to("requirements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/requirements/1").to route_to("requirements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/requirements/1").to route_to("requirements#destroy", id: "1")
    end
  end
end
