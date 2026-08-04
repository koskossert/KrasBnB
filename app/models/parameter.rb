class Parameter < ApplicationRecord
  has_many :characteristic
  has_many :listing, through: :characteristic
end
