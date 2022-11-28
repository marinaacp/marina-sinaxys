class Job < ApplicationRecord
  has_many :applys
  has_many :users, through: :applys
end
