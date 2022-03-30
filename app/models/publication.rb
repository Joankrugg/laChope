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
    if link[0..6] == 'http://' || link[0..7] == 'https://'
      begin
      preview = LinkThumbnailer.generate(link)
      preview.title
      rescue LinkThumbnailer::Exceptions => e
      preview = 'No title'
      end
    end
  end

  def link_favicon
    if link[0..6] == 'http://' || link[0..7] == 'https://'
      begin
      preview = LinkThumbnailer.generate(link)
      preview.favicon
      rescue LinkThumbnailer::Exceptions => e
      preview = 'https://res.cloudinary.com/da2krghvd/image/upload/v1636547916/Admin/Logo.png'
      end
    end
  end

  def link_description
    if link[0..6] == 'http://' || link[0..7] == 'https://'
      begin
      preview = LinkThumbnailer.generate(link)
      preview.description
      rescue LinkThumbnailer::Exceptions => e
      preview = 'No description'
      end
    end
  end

  def link_image
    if link[0..6] == 'http://' || link[0..7] == 'https://'
      begin
      preview = LinkThumbnailer.generate(link)
      preview.image
      rescue LinkThumbnailer::Exceptions => e
      preview = 'https://res.cloudinary.com/da2krghvd/image/upload/v1636547916/Admin/Logo.png'
      end
    end
  end

end
