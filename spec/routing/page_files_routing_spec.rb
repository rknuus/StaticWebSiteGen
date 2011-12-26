require "spec_helper"

describe PageFilesController do
  describe "routing" do

    it "routes to #new" do
      get("/page_files/new").should route_to("page_files#new")
    end

    it "routes to #show" do
      get("/page_files/1").should route_to("page_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/page_files/1/edit").should route_to("page_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/page_files").should route_to("page_files#create")
    end

    it "routes to #update" do
      put("/page_files/1").should route_to("page_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/page_files/1").should route_to("page_files#destroy", :id => "1")
    end

  end
end
