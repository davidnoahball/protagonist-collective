class Adventure < ApplicationRecord
  has_many :pages
  has_many :users, through: :pages

  def page_count
    self.pages.all.count
  end
  def critical?
    self.page_count >= self.critical_size
  end
end