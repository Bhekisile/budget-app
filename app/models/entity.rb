class Entity < ApplicationRecord
  belongs_to :users
  belongs_to :groups
  belongs_to :entity_groups
end
