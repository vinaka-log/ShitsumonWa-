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

    it "is confirm invalid email" do
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

    it "is valid if nationality is 45 characters or less" do
      @user.nationality = "a" * 45
      expect(@user).to be_valid
    end

    it "is invalid if nationality is 46 characters" do
      @user.nationality = "a" * 46
      expect(@user).to be_invalid
    end
  end

  describe "password" do
    it "is invalid without password" do
      @user.crypted_password = "" * 6
      expect(@user).to be_invalid
    end

    it "is valid if password is 6 characters" do
      @user.password = @user.password_confirmation = "a" * 6
      expect(@user).to be_valid
    end

    it "is valid if password is 5 characters" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to be_invalid
    end
  end

  describe "twitter" do
    it "is valid if twitter is 255 characters" do
      @user.twitter = "https://" + "a" * 243 + ".com"
      expect(@user).to be_valid
    end

    it "is invalid if twitter is 256 characters" do
      @user.twitter = "https://" + "a" * 244 + ".com"
      expect(@user).to be_invalid
    end

    it "confirm valid twitter" do
      @user.twitter = "https://example.com"
      expect(@user).to be_valid

      @user.twitter = "http://example.com"
      expect(@user).to be_valid

      @user.twitter = "https://www.example.com"
      expect(@user).to be_valid
    end

    it "confirm invalid twitter" do
      @user.twitter = "ttps://example.com"
      expect(@user).to be_invalid

      @user.twitter = "httpss://example.com"
      expect(@user).to be_invalid
    end
  end

  describe "facebook" do
    it "is valid if facebook is 255 characters" do
      @user.facebook = "https://" + "a" * 243 + ".com"
      expect(@user).to be_valid
    end

    it "is invalid if facebook is 256 characters" do
      @user.facebook = "https://" + "a" * 244 + ".com"
      expect(@user).to be_invalid
    end

    it "confirm valid facebook" do
      @user.facebook = "https://example.com"
      expect(@user).to be_valid

      @user.facebook = "http://example.com"
      expect(@user).to be_valid

      @user.facebook = "https://www.example.com"
      expect(@user).to be_valid
    end

    it "confirm invalid facebook" do
      @user.facebook = "ttps://example.com"
      expect(@user).to be_invalid

      @user.facebook = "httpss://example.com"
      expect(@user).to be_invalid
    end
  end

  describe "instagram" do
    it "is valid if instagram is 255 characters" do
      @user.instagram = "https://" + "a" * 243 + ".com"
      expect(@user).to be_valid
    end

    it "is invalid if instagram is 256 characters" do
      @user.instagram = "https://" + "a" * 244 + ".com"
      expect(@user).to be_invalid
    end

    it "confirm valid instagram" do
      @user.instagram = "https://example.com"
      expect(@user).to be_valid

      @user.instagram = "http://example.com"
      expect(@user).to be_valid

      @user.instagram = "https://www.example.com"
      expect(@user).to be_valid
    end

    it "confirm invalid instagram" do
      @user.instagram = "ttps://example.com"
      expect(@user).to be_invalid

      @user.instagram = "httpss://example.com"
      expect(@user).to be_invalid
    end
  end

end
