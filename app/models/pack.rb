class Pack < ApplicationRecord
  belongs_to :bottle
  has_many :projects
end
