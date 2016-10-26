class Adventure < ApplicationRecord
  has_many :pages
  has_many :users, through: :pages
  has_many :bookmarks
  accepts_nested_attributes_for :pages

  def post_attributes=(attrs)
    attrs.values.each do |attr_set|
      page = Page.new(attr_set)
      page.save!(:validate => false)
      self.pages << page
    end
  end

  def root
    root = self.pages.where("parent_id IS NULL").ids[0]
  end
  def root_path #I originally thought that this was just "/adventures/#{self.id}/pages/1". Glad I abstracted it!
    "/adventures/#{self.id}/pages/#{self.root}"
  end
  def page_count
    self.pages.all.count
  end
  def critical?
    self.page_count >= self.critical_size
  end
  def complete
    complete = true
    self.pages.all.each do |page|
      if !page.end?
        complete = false
        break
      end
    end
    complete
  end
  def status
    if self.complete
      return "closed"
    end
    if self.critical?
      return "critical"
    end
    return "open"
  end
end
#open, closed, critical