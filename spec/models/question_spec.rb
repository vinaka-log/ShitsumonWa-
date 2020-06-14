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
end
