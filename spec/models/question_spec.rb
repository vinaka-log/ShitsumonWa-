require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.create(:question)
  end

  describe "question" do
    it "name, description and image" do
      expect(@question).to be_valid
    end
  end

  describe "name" do
    it "is invalid without name" do
      @question.name = ""
      expect(@question).to be_invalid
    end

    it "is valid if name is  50 characters" do
      @question.name = "a" * 50
      expect(@question).to be_valid
    end

    it "is valid if name is  51 characters or more" do
      @question.name = "a" * 51
      expect(@question).to be_invalid
    end
  end
end
