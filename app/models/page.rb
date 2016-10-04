class Page < ApplicationRecord
  belongs_to :user
  belongs_to :adventure

  before_validation :filter_empty

  validates :choice1, :choice2, :end, length: {in: 1...60}, allow_nil: true
  validates :body, length: {in: 50...1000}
  validate :validate_endings_choices
  validate :validate_end_allowed, if: "self.end"

  def validate_endings_choices
    if self.end && (self.choice1 || self.choice2)
      errors.add(:base, :not_valid, message: "You can't have an ending and choices!")
    end
    if !(self.end || self.choice1 || self.choice2)
      errors.add(:base, :not_valid, message: "You need either an ending or choices!")
    end
  end
  def validate_end_allowed
    if !(self.adventure.critical? || self.user.ends_available?(self.adventure))
      errors.add(:end, :not_valid, message: ": You can't write an ending unless you have written a choices page or the adventure is critical!")
    end
  end

  def filter_empty
    self.attributes.each_pair do |k, v|
      if v.blank? then self[k] = nil end
    end
  end

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
  def snip
    self.body.split(" ")[0..10].join(" ")
  end
end