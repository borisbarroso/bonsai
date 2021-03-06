require 'spec_helper'

describe OrganisationsController do

  def mock_organisation(stubs={})
    @mock_organisation ||= mock_model(Organisation, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all organisations as @organisations" do
      Organisation.stub(:all) { [mock_organisation] }
      get :index
      assigns(:organisations).should eq([mock_organisation])
    end
  end

  describe "GET show" do
    it "assigns the requested organisation as @organisation" do
      Organisation.stub(:find).with("37") { mock_organisation }
      get :show, :id => "37"
      assigns(:organisation).should be(mock_organisation)
    end
  end

  describe "GET new" do
    it "assigns a new organisation as @organisation" do
      Organisation.stub(:new) { mock_organisation }
      get :new
      assigns(:organisation).should be(mock_organisation)
    end
  end

  describe "GET edit" do
    it "assigns the requested organisation as @organisation" do
      Organisation.stub(:find).with("37") { mock_organisation }
      get :edit, :id => "37"
      assigns(:organisation).should be(mock_organisation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created organisation as @organisation" do
        Organisation.stub(:new).with({'these' => 'params'}) { mock_organisation(:save => true) }
        post :create, :organisation => {'these' => 'params'}
        assigns(:organisation).should be(mock_organisation)
      end

      it "redirects to the created organisation" do
        Organisation.stub(:new) { mock_organisation(:save => true) }
        post :create, :organisation => {}
        response.should redirect_to(organisation_url(mock_organisation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organisation as @organisation" do
        Organisation.stub(:new).with({'these' => 'params'}) { mock_organisation(:save => false) }
        post :create, :organisation => {'these' => 'params'}
        assigns(:organisation).should be(mock_organisation)
      end

      it "re-renders the 'new' template" do
        Organisation.stub(:new) { mock_organisation(:save => false) }
        post :create, :organisation => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested organisation" do
        Organisation.should_receive(:find).with("37") { mock_organisation }
        mock_organisation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :organisation => {'these' => 'params'}
      end

      it "assigns the requested organisation as @organisation" do
        Organisation.stub(:find) { mock_organisation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:organisation).should be(mock_organisation)
      end

      it "redirects to the organisation" do
        Organisation.stub(:find) { mock_organisation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(organisation_url(mock_organisation))
      end
    end

    describe "with invalid params" do
      it "assigns the organisation as @organisation" do
        Organisation.stub(:find) { mock_organisation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:organisation).should be(mock_organisation)
      end

      it "re-renders the 'edit' template" do
        Organisation.stub(:find) { mock_organisation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested organisation" do
      Organisation.should_receive(:find).with("37") { mock_organisation }
      mock_organisation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the organisations list" do
      Organisation.stub(:find) { mock_organisation(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(organisations_url)
    end
  end

end
