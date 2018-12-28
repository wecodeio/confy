class Conference < ApplicationRecord
  has_one_attached :image
  has_many :talks, class_name: "Talk"

  before_save :assign_slug
  validates :slug, uniqueness: true

  private
    def assign_slug
      self.slug = "#{start_date.year}-#{title.downcase.gsub(' ', '-')}"
    end
end
