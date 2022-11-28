class Job < ApplicationRecord
  has_many :users, dependent: :destroy
end
