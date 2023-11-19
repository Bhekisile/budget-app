class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, through: :entity_groups
  has_many :entity_groups, dependent: :destroy

  validates :name, :icon, presence: true
end
