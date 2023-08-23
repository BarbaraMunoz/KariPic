class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        enum :role, [:normal, :ejecutivo, :admin]

        has_one_attached :avatar
        has_many :comments
        has_many :karina_photos

        validates :name, presence: true
        validates :avatar, presence: true
end
