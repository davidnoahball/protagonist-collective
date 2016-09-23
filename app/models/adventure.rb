class Adventure < ApplicationRecord
  has_many :pages
  has_many :users, through: :pages

  def page_count
    self.pages.all.count
  end
end