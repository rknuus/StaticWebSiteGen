require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SiteTextsController do

  # This should return the minimal set of attributes required to create a valid
  # SiteText. As you add validations to SiteText, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    # site = Site.create(:name => "MyString", :template => "MyText")
    @site = stub_model(Site, :id => 1, :name => "MyString", :template => "MyText")
    
    { :content => '&nbsp;', :name => 'n.n.', :site_id => @site.id }
  end

  describe "GET new" do
    it "assigns a new site_text as @site_text" do
      get :new
      assigns(:site_text).should be_a_new(SiteText)
    end
  end

  describe "GET edit" do
    it "assigns the requested site_text as @site_text" do
      site_text = SiteText.create! valid_attributes
      get :edit, :id => site_text.id
      assigns(:site_text).should eq(site_text)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SiteText" do
        expect {
          post :create, :site_text => valid_attributes
        }.to change(SiteText, :count).by(1)
      end

      it "assigns a newly created site_text as @site_text" do
        post :create, :site_text => valid_attributes
        assigns(:site_text).should be_a(SiteText)
        assigns(:site_text).should be_persisted
      end

      it "redirects to the created site_text" do
        post :create, :site_text => valid_attributes
        response.should redirect_to(site_url(valid_attributes[:site_id]))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site_text as @site_text" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteText.any_instance.stub(:save).and_return(false)
        post :create, :site_text => {}
        assigns(:site_text).should be_a_new(SiteText)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteText.any_instance.stub(:save).and_return(false)
        post :create, :site_text => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested site_text" do
        site_text = SiteText.create! valid_attributes
        # Assuming there are no other site_texts in the database, this
        # specifies that the SiteText created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SiteText.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => site_text.id, :site_text => {'these' => 'params'}
      end

      it "assigns the requested site_text as @site_text" do
        site_text = SiteText.create! valid_attributes
        put :update, :id => site_text.id, :site_text => valid_attributes
        assigns(:site_text).should eq(site_text)
      end

      it "redirects to the site_text" do
        site_text = SiteText.create! valid_attributes
        put :update, :id => site_text.id, :site_text => valid_attributes
        response.should redirect_to(site_url(site_text.site_id))
      end
    end

    describe "with invalid params" do
      it "assigns the site_text as @site_text" do
        site_text = SiteText.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteText.any_instance.stub(:save).and_return(false)
        put :update, :id => site_text.id, :site_text => {}
        assigns(:site_text).should eq(site_text)
      end

      it "re-renders the 'edit' template" do
        site_text = SiteText.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteText.any_instance.stub(:save).and_return(false)
        put :update, :id => site_text.id, :site_text => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site_text" do
      site_text = SiteText.create! valid_attributes
      expect {
        delete :destroy, :id => site_text.id
      }.to change(SiteText, :count).by(-1)
    end

    it "redirects to the site_texts list" do
      site_text = SiteText.create! valid_attributes
      delete :destroy, :id => site_text.id
      response.should redirect_to(site_url(site_text.site_id))
    end
  end

end
