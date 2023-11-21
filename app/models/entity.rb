class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :groups, through: :entity_groups
  belongs_to :entity_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
