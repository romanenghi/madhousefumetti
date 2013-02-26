require "spec_helper"

describe SchedaFumettosController do
  describe "routing" do

    it "routes to #index" do
      get("/scheda_fumettos").should route_to("scheda_fumettos#index")
    end

    it "routes to #new" do
      get("/scheda_fumettos/new").should route_to("scheda_fumettos#new")
    end

    it "routes to #show" do
      get("/scheda_fumettos/1").should route_to("scheda_fumettos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scheda_fumettos/1/edit").should route_to("scheda_fumettos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scheda_fumettos").should route_to("scheda_fumettos#create")
    end

    it "routes to #update" do
      put("/scheda_fumettos/1").should route_to("scheda_fumettos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scheda_fumettos/1").should route_to("scheda_fumettos#destroy", :id => "1")
    end

  end
end
