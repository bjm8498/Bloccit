require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question)  {Question.create!}

  describe "it responds to the following attributes" do
    it "responds to these 3 attributes" do
      expect(question).to respond_to(:title)
      expect(question).to respond_to(:body)
      expect(question).to respond_to(:resolved)
    end
  end
end
