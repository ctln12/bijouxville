class Jewel < ApplicationRecord
  belongs_to :jeweler
  has_many :jewel_stones
  has_many :stones, through: :jewel_stones
  has_one :jewel_material
  has_one :material, through: :jewel_material
end
