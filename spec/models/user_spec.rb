require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "user" do
    it "is valid with name, email, nationality, password, password_confirmation"  do
      expect(@user).to be_valid
    end
  end

  describe "name" do
    it "is invalid without name" do
      @user.name = ""
      expect(@user).to be_invalid
    end

    it "is valid if password is less 50 characters" do
      @user.name = "a" * 50
      expect(@user).to be_valid
    end

    it "is invalid if password is more 50 characters" do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end
  end
     

end
