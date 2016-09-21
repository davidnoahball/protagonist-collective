class Adventure < ApplicationRecord
  has_many :pages
  has_many :users, through: :pages
end