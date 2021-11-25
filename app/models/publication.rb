class Publication < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :content, presence: true, allow_blank: true
  has_one_attached :photo
  has_one_attached :video

  after_create :link_title
  after_create :link_favicon
  after_create :link_description
  after_create :link_image

  def link_title
    preview = LinkThumbnailer.generate(link)
    preview.title
  end

  def link_favicon
    preview = LinkThumbnailer.generate(link)
    preview.favicon
  end

  def link_description
    preview = LinkThumbnailer.generate(link)
    preview.description
  end

  def link_image
    preview = LinkThumbnailer.generate(link)
    preview.images.first.src
  end

end
