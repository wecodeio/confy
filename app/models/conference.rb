class Conference < ApplicationRecord
  has_one_attached :image
  has_many :talks, class_name: "Talk"

  before_save :assign_slug

  validates :slug, uniqueness: true, presence: true
  validates :image, blob: { content_type: ["image/png", "image/jpg", "image/jpeg"], size_range: 0..2.megabytes }

  private
    def assign_slug
      self.slug = "#{start_date.year}-#{title.downcase.gsub(' ', '-')}"
    end
end
