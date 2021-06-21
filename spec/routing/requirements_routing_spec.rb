require "rails_helper"

RSpec.describe RequirementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/workshop/requirements").to route_to("admin/workshop/requirements#index")
    end

    it "routes to #show" do
      expect(get: "/admin/workshop/requirements/1").to route_to("admin/workshop/requirements#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/workshop/requirements/new/3").to route_to("admin/workshop/requirements#create", classroom_id: "3")
    end

    it "routes to #edit" do
      expect(get: "/admin/workshop/requirements/1/edit/3").to route_to("admin/workshop/requirements#edit", id: "1", classroom_id: "3")
    end

    it "routes to #update via PATCH" do
      expect(post: "/admin/workshop/requirements/1/edit/3").to route_to("admin/workshop/requirements#update", id: "1", classroom_id: "3")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/workshop/requirements/1").to route_to("admin/workshop/requirements#destroy", id: "1")
    end
  end
end
