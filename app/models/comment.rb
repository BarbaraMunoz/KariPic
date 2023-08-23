class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :karina_photo

  validates :content, presence: true
end
