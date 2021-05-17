class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :photo
  has_many :stickers, dependent: :destroy
  has_many :beers, dependent: :destroy
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_one :design, :dependent => :destroy
  has_many :fancies
  has_many :beers, through: :fancies
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :articles, dependent: :destroy
  belongs_to :sexe, optional: :true
  has_many :tastings
  has_many :beers, through: :tastings
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy
  has_many :typical_beers, dependent: :destroy
  has_many :projects, dependent: :destroy
  def name
    email.split('@')[0]
  end

end
