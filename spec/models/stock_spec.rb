# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stock, type: :model do
  before do
    @stock = FactoryBot.create(:stock)
  end
  it 'is valid if user and question exists' do
    expect(@stock).to be_valid
  end

  it 'is invalid without user' do
    @stock.user_id = ""
    expect(@stock).to be_invalid
  end
    
  it 'is invalid without question' do
    @stock.question_id = ""
    expect(@stock).to be_invalid
  end
end
