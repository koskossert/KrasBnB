class Characteristic < ApplicationRecord
  belongs_to :listing
  belongs_to :parameter
end
