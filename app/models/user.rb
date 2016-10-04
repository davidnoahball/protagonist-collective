class User < ApplicationRecord
  has_many :pages
  has_many :adventures, through: :pages

  validates :name, presence: true

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
    ends = 0
    choices = 0
    subbed = self.submitted(adventure)
    subbed.each do |page|
      if page.end?
        ends += 1
      else
        choices += 1
      end
    end
    return choices - ends
  end
  def ends_available?(adventure)
    return self.ends_available(adventure) > 0
  end
end