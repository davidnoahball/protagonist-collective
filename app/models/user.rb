class User < ApplicationRecord
  has_many :pages
  has_many :adventures, through: :pages

  validates :name, presence: true
  validates :name, uniqueness: true, if: "!self.uid"
  validates :name, length: {maximum: 50}, if: "!self.uid"
  validates :email, length: {maximum: 50}, if: "!self.uid"
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

  def submitted(adventure)
    adventure.pages.where("user_id = ?", self.id)
  end
  def ends_available(adventure)
    count = 0
    subbed = self.submitted(adventure)
    subbed.each do |page|
      if page.end? then count += 1 end
    end
    return subbed.size - count
  end

  def ends_available?(adventure)
    return self.ends_available(adventure) > 0
  end
end