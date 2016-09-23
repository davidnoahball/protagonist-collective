class Page < ApplicationRecord
  belongs_to :user
  belongs_to :adventure

  validates :choice1, :choice2, :end, length: {in: 1..30}, allow_nil: true
  validates :body, length: {in: 50..1000}

  def self.word_count
    total = 0
    Page.all.each do |page|
      if page.body.nil? || page.body.empty? then next end
      total += page.body.split(" ").count
      if page.end then total += page.end.split(" ").count end
    end
    total
  end
  def self.count
    Page.all.count
  end
  def end?
    self.end ? true : false
  end
  def path
    "/adventures/#{self.adventure.id}/pages/#{self.id}"
  end
  def parent_path
    "/adventures/#{self.adventure.id}/pages/#{self.parent_id}"
  end
  def child1_path
    "/adventures/#{self.adventure.id}/pages/#{self.child1_id}"
  end
  def child2_path
    "/adventures/#{self.adventure.id}/pages/#{self.child2_id}"
  end
  def user_path
    "/users/#{self.user.id}"
  end
end