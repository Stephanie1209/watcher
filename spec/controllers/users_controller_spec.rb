require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create :user
    @user2 = FactoryGirl.create :user
  end

  describe "GET #index" do
    it "populates an array of all users" do
      get :index
      expect(assigns(:users)).to match_array([@user, @user2])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: @user
      expect(assigns(:user)).to eq(@user)
    end

    it "renders the :show view" do
      get :show, id: @user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      get :edit, id: @user
      expect(assigns(:user)).to eq(@user)
    end

    it "renders the :edit view" do
      get :edit, id: @user
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to users#show" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to user_path(assigns(:user))
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user, email: nil)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: FactoryGirl.attributes_for(:user, email: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context "valid attributes" do
      it "finds the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "Different", email: "me@me.com")
        @user.reload
        expect(@user.name).to eq("Different")
        expect(@user.email).to eq("me@me.com")
      end

      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

    context "with invalid attributes" do
      it "does not change the user's attributes" do
        name = @user.name
        email = @user.email
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "Different", email: nil)
        @user.reload
        expect(@user.name).to eq(name)
        expect(@user.email).to eq(email)
      end

      it "re-renders the edit template" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "Different", email: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the contact" do
      expect{
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end

    it "redirects to users#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_path
    end
  end
end
