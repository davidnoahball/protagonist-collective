class Adventure < ApplicationRecord
  has_many :pages
  has_many :users, through: :pages
  accepts_nested_attributes_for :pages

  def post_attributes=(attrs)
    attrs.values.each do |attr_set|
      page = Page.new(attr_set)
      page.save!(:validate => false)
      self.pages << page
    end
  end

  def root_path #I originally thought that this was just "/adventures/#{self.id}/pages/1". Glad I abstracted it!
    root = self.pages.where("parent_id IS NULL").ids[0]
    "/adventures/#{self.id}/pages/#{root}"
  end
  def page_count
    self.pages.all.count
  end
  def critical?
    self.page_count >= self.critical_size
  end
end