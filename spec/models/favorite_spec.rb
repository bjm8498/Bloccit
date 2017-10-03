require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  describe "#Favorites display" do
    it "should return comment and vote count" do
      post_count = favorite.posts.length
      comment_count = favorite.comments.length

      expect(favorite.post.length).to eq(post_count)
      expect(favorite.comment.length).to eq(comment_count)
    end
  end

end
