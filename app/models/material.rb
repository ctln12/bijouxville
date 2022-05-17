class Material < ApplicationRecord
  has_one :jewel_material
  has_one :jewel, through: :jewel_material
end
