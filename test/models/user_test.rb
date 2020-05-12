require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "kimura", email: "kimura@example.com",nationality: "japan", password: "kimurania", password_confirmation: "kimurania")
  end

  


end
