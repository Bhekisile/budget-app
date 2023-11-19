class EntityGroup < ApplicationRecord
  has_many :entity
  has_many :group
end
