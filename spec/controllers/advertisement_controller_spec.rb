require 'rails_helper'

RSpec.describe AdvertisementController, type: :controller do

  let(:my_advertisement) {Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_sentence)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_advertisement to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns my_advertisement to @advertisement" do
      get :show, params: {id: my_advertisement.id}
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "initializes @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end

  end

  describe "GET #create" do
    it "increases the number of advertisements by 1" do
      expect{ post :create, params:{advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_sentence}}}.to change(Advertisement, :count).by(1)
    end

    it "assigns Advertisement.last to @advertisement" do
      post :create, params:{advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_sentence}}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, params:{advertisement:{title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_sentence}}
      expect(response).to redirect_to Advertisement.last
    end
  end


end
