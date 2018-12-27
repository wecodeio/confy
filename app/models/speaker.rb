class Speaker < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :talks, class_name: "Talk"
  
  validates_presence_of :name, :slug
  validates :avatar, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 0..2.megabytes }

end
