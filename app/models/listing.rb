class Listing < ApplicationRecord
  has_many :booking, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :image, dependent: :destroy

  has_many :characteristic
  has_many :parameters, through: :characteristic

  belongs_to :user
end
