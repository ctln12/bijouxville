class Jeweler < ApplicationRecord
  has_many :jewels, dependent: :destroy
end
