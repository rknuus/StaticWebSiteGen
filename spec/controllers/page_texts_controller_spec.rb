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

describe PageTextsController do

  # This should return the minimal set of attributes required to create a valid
  # PageText. As you add validations to PageText, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    @page = stub_model(Page, :id => 1, :name => "MyString", :content => "MyText")
    
    { :content => '&nbsp;', :name => 'n.n.', :page_id => @page.id }
  end

  describe "GET show" do
    it "assigns the requested page_text as @page_text" do
      page_text = PageText.create! valid_attributes
      get :show, :id => page_text.id
      assigns(:page_text).should eq(page_text)
    end
  end

  describe "GET new" do
    it "assigns a new page_text as @page_text" do
      get :new
      assigns(:page_text).should be_a_new(PageText)
    end
  end

  describe "GET edit" do
    it "assigns the requested page_text as @page_text" do
      page_text = PageText.create! valid_attributes
      get :edit, :id => page_text.id
      assigns(:page_text).should eq(page_text)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PageText" do
        expect {
          post :create, :page_text => valid_attributes
        }.to change(PageText, :count).by(1)
      end

      it "assigns a newly created page_text as @page_text" do
        post :create, :page_text => valid_attributes
        assigns(:page_text).should be_a(PageText)
        assigns(:page_text).should be_persisted
      end

      it "redirects to the parent page" do
        post :create, :page_text => valid_attributes
        response.should redirect_to(page_url(valid_attributes[:page_id]))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page_text as @page_text" do
        # Trigger the behavior that occurs when invalid params are submitted
        PageText.any_instance.stub(:save).and_return(false)
        post :create, :page_text => {}
        assigns(:page_text).should be_a_new(PageText)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PageText.any_instance.stub(:save).and_return(false)
        post :create, :page_text => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page_text" do
        page_text = PageText.create! valid_attributes
        # Assuming there are no other page_texts in the database, this
        # specifies that the PageText created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PageText.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => page_text.id, :page_text => {'these' => 'params'}
      end

      it "assigns the requested page_text as @page_text" do
        page_text = PageText.create! valid_attributes
        put :update, :id => page_text.id, :page_text => valid_attributes
        assigns(:page_text).should eq(page_text)
      end

      it "redirects to the parent page" do
        page_text = PageText.create! valid_attributes
        put :update, :id => page_text.id, :page_text => valid_attributes
        response.should redirect_to(page_url(valid_attributes[:page_id]))
      end
    end

    describe "with invalid params" do
      it "assigns the page_text as @page_text" do
        page_text = PageText.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PageText.any_instance.stub(:save).and_return(false)
        put :update, :id => page_text.id, :page_text => {}
        assigns(:page_text).should eq(page_text)
      end

      it "re-renders the 'edit' template" do
        page_text = PageText.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PageText.any_instance.stub(:save).and_return(false)
        put :update, :id => page_text.id, :page_text => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page_text" do
      page_text = PageText.create! valid_attributes
      expect {
        delete :destroy, :id => page_text.id
      }.to change(PageText, :count).by(-1)
    end

    it "redirects to the parent page" do
      page_text = PageText.create! valid_attributes
      delete :destroy, :id => page_text.id
      response.should redirect_to(page_url(valid_attributes[:page_id]))
    end
  end

end
