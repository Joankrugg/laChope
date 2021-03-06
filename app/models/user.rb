class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :beers
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_one :design, :dependent => :destroy
  has_many :fancies
  has_many :beers, through: :fancies
  has_many :ratings
  has_many :beers, through: :ratings
end
