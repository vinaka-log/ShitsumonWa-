require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without nationality" do
    user = User.new(nationality: nil)
    user.valid?
    expect(user.errors[:nationality]).to include("can't be blank")
  end

  it "is invalid without password" do 
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  
  it "is invalid without password_confirmation" do 
    user = User.new(password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    User.create(
      name: "vinaka",
      email: "vinaka@example.com",
      nationality: "japan",
      password: "1234abcd",
      password_conformation: "1234abcd",
    )

    user = User.new(
      name: "vitamin",
      email: "vinaka@example.com",
      nationality: "japan",
      password: "1234abcd",
      password_confirmation: "1234abcd",
    )
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
  end
     

end
