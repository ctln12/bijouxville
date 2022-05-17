class Stone < ApplicationRecord
  has_many :jewel_stones
  has_many :jewels, through: :jewel_stones
end
