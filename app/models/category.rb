class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  validates :name, presence: true
  validates :icon, presence: true
  attribute :total_amount, :decimal, default: 0.0
end
