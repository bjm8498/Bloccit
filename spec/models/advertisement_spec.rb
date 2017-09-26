require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create! }

  describe "attributes" do
    it "responds to it attributes" do
      expect(advertisement).to respond_to(:title)
      expect(advertisement).to respond_to(:copy)
      expect(advertisement).to respond_to(:price)
    end
  end
end
