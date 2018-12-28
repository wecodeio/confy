class Speaker < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :talks, class_name: "Talk"

  validates :slug, uniqueness: true, presence: true
  validates :avatar, blob: { content_type: ["image/png", "image/jpg", "image/jpeg"], size_range: 0..2.megabytes }
end
