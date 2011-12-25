require "spec_helper"

describe SiteFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/site_files").should route_to("site_files#index")
    end

    it "routes to #new" do
      get("/site_files/new").should route_to("site_files#new")
    end

    it "routes to #show" do
      get("/site_files/1").should route_to("site_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_files/1/edit").should route_to("site_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_files").should route_to("site_files#create")
    end

    it "routes to #update" do
      put("/site_files/1").should route_to("site_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_files/1").should route_to("site_files#destroy", :id => "1")
    end

  end
end
