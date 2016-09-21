class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true, if: "!self.uid"
  validates :email, presence: true, if: "!self.uid"
  validates :email, uniqueness: true, if: "!self.uid"
  validates_format_of :email, :with => /@/, if: "!self.uid"

  has_secure_password
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!(:validate => false)
    end
  end
end