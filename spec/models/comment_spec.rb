require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)
  end

  describe "comment" do
    it "is valid with content" do
      @comment.content = ""
      expect(@comment).to be_invalid
    end

    it "is valid if content is  255 character" do
      @comment.content = "a" * 255
      expect(@comment).to be_valid
    end

    it "is valid if content is  256 character or more" do
      @comment.content = "a" * 256
      expect(@comment).to be_invalid
    end
  end
end
