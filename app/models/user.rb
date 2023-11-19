class User < ApplicationRecord
  has_many :entities, class_name: 'entity', foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
end
