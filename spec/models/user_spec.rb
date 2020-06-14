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

    it "is valid if name is less 50 characters" do
      @user.name = "a" * 50
      expect(@user).to be_valid
    end

    it "is invalid if name is more 50 characters" do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end
  end

  describe "email" do
    it "is invalid without name" do
      @user.email = ""
      expect(@user).to be_invalid
    end

    it "is valid if email is 255 characters" do
      @user.email = "a" * 243 + "@example.com"
      expect(@user).to be_valid
    end

    it "is invalid if email is 256 characters" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to be_invalid
    end

    it "is confirm valid email address" do
      @user.email = "test@example.com"
      expect(@user).to be_valid

      @user.email = "TEST@example.COM"
      expect(@user).to be_valid

      @user.email = "T_Est@example.user.com"
      expect(@user).to be_valid

      @user.email = "test.user@example.jp"
      expect(@user).to be_valid

      @user.email = "user+test@example.net"
      expect(@user).to be_valid
    end

    it "is confirm invalid email address" do
      @user.email = "test@example,com"
      expect(@user).to be_invalid

      @user.email = "test_example.org"
      expect(@user).to be_invalid

      @user.email = "test.user@example."
      expect(@user).to be_invalid

      @user.email = "test@user_example.com"
      expect(@user).to be_invalid

      @user.email = "test@user+example.com"
      expect(@user).to be_invalid
    end
     
    it "is invalid if email is not uniqueness  " do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save!
      expect(duplicate_user).to be_invalid
    end

    it "confirm email is saved in lowercase" do
      @user.email = "Test@examplE.coM"
      @user.save!
      expect(@user.reload.email).to eq 'test@example.com'
    end  
  end

  describe "nationality" do
    it "is invalid without nationality" do
      @user.nationality = ""
      expect(@user).to be_invalid
    end

    it "is valid if nationality is less 45 characters" do
      @user.nationality = "a" * 45
      expect(@user).to be_valid
    end

    it "is invalid if nationality is more 45 characters" do
      @user.nationality = "a" * 46
      expect(@user).to be_invalid
    end
  end




     

end
