class Job < ApplicationRecord
  has many :applys
  has_many :users, through: :applys
end
