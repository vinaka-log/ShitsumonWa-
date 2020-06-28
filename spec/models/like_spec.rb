require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.create(:like)
  end
  it 'is valid if user and question exists' do
    expect(@like).to be_valid
  end

  it 'is invalid without user' do
    @like.user_id = ""
    expect(@like).to be_invalid
  end
    
  it 'is invalid without question' do
    @like.question_id = ""
    expect(@like).to be_invalid
  end
end