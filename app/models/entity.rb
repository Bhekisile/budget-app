class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :groups, through: :entity_groups
  has_many :entity_groups, dependent: :destroy
end
