class Article < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  validates :title, presence: :true,
                    length: { minimum: 5 }
end
