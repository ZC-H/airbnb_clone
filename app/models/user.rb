class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  enum gender: [:male,:female]
  enum role: [:customer,:moderator,:admin]
  mount_uploader :avatar, ImageUploader

  #Facebook OAuth
    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        name: auth_hash["name"],
        email: auth_hash["extra"]["raw_info"]["email"]
        #Expand this once User has more attributes:
        #See Auth Hash in documentation
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

end
