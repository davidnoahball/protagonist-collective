class Bookmark < ApplicationRecord
  belongs_to :adventure
  belongs_to :user
  belongs_to :page
end
