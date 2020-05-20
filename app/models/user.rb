class User < ApplicationRecord
  authenticates_with_sorcery!

  # validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
      
  # validates :nationality, presence: true,length: { maximum: 45 }
  
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
  

                  
  
end
