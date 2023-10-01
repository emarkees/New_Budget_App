class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category # Assuming you have a `category_id` column in your transactions table

  validates :name, presence: true
  validates :amount, presence: true
  validates :user, presence: true

  def related_transactions
    # Assuming you want to find transactions with the same category_id
    Transaction.where(category_id:)
  end
end
