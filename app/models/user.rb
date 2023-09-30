class User < ApplicationRecord
  has_many :categories
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :password
  validates_presence_of :name
end
