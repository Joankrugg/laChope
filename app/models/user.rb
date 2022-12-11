class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :photo
  has_many :answers, dependent: :destroy
  has_one :access, dependent: :destroy
  has_many :stickers, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :beers, dependent: :destroy
  has_many :feeds, dependent: :destroy
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
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy
  has_many :typical_beers, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_one :store, dependent: :destroy
  validates :privacy_code, uniqueness: true, allow_blank: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :email, :city, :age ],
    associated_against: {
      activities: [ :name ],
      sexe: [ :name]
    },
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }

  def name
    email.split('@')[0]
  end

  def hobbyist
    b = Beer.where(user_id: self)
    if b.count >= 10
      true
    end
  end

  def creative
    s = Sticker.where(user_id: self)
    if s.count >= 5
      true
    end
  end

  def beer_connaisseur
    t = Tasting.where(user_id: self)
    if t.count >= 10
      true
    end
  end

  def target_angel
    ta = Project.where(user_id: self)
    if ta.count >= 1
      true
    end
  end
  def businessman
    if self.store.present? && self.store.market_place_id != nil
      true
    end
  end

  after_create :send_welcome_email
  after_create :send_admin_mail

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
  def notify_admin_email
    AdminMailer.new_registration(@user).deliver_now
  end


  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver_now
  end

end
