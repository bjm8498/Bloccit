require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsoredpost) { topic.sponsored_posts.create!(title: title, body: body)}

  it{is_expected.to belong_to(:topic)}

  describe "attributes" do

    it "is expected to respond to these attributes" do
      expect(sponsoredpost).to have_attributes(title: title, body: body)
    end
  end
end
