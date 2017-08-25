require 'rails_helper'

RSpec.describe QuestionController, type: :controller do

  let(:my_question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @questions to my_question" do
      expect(assigns(:question)).to eq(my_question)
    end

  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      expect(response).to render_template :new
    end

    it "initializes @question" do
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of questions by 1" do
      expect{question :create, params:{title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}}.to change(Question, :count).by(1)
    end

    it "assigns question.last to @question" do
      question :create, params:{title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}
      expect(assigns(:question)).to eq Question.last
    end

    it "redirects to the new question" do
      question :create, params:{title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}
      expect(response).to redirect_to Question.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "expects to render show view" do
      get :show, params: {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns @question to my_question" do
      get :show, params: {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params:{id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get :edit, params:{id: my_question.id}
      expect(response).to render_template :edit
    end

    it "assigns topic to be updated to @question" do
      get :edit, params:{id: my_question.id}
      question_instance = assigns(:question)

      expect(question_instance.id).to eq my_question.id
      expect(question_instance.title).to eq my_question.title
      expect(question_instance.body).to eq my_question.body
      expect(question_instance.resolved).to eq my_question.resolved
    end


  end

  describe "PUT #update" do

    it "updates @question with the expected attributes" do

      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params:{id: my_question.id, question:{title: new_title, body: new_body}}
      updated_question = assigns(:question)
      expect(updated_question.id).to eq(my_question.id)
      expect(updated_question.title).to eq(my_question.title)
      expect(updated_question.body).to eq(my_question.body)

    end

    it "redirects to the updated question" do

      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: {id: my_question.id, question: {title: new_title, body: new_body}}
      expect(response).to redirect_to my_question

    end
  end

  describe "DELETE destroy" do
    it "deletes the question" do
      delete :destroy, params:{id: my_question.id}
      count = Question.where({id: my_question.id}).size
      expect(count).to eq(0)
    end

    it "redirects to the questions index" do
      delete :destroy, params:{id: my_question.id}
      expect(response).to redirect_to questions_path
    end
  end

end
