class Page < ApplicationRecord
  belongs_to :user
  belongs_to :adventure

  validates :choice1, :choice2, :end, length: {in: 1..30}, allow_nil: true
end