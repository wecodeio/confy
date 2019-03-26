class Conference < ApplicationRecord
  has_one_attached :image
  has_many :talks, class_name: "Talk"

  validates :slug, uniqueness: true, presence: true
  validates :image, blob: { content_type: ["image/png", "image/jpg", "image/jpeg"], size_range: 0..2.megabytes }

  validates :title, presence: true
  # validates :description
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :place
  validates :url, presence: true, format: { with: /(http:\/\/|https:\/\/|)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?/ix }

  accepts_nested_attributes_for :talks, allow_destroy: true

end
