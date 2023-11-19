class EntityGroup < ApplicationRecord
  has_many :entities
  has_many :groups
end
