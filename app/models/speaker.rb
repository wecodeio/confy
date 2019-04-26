class Speaker < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :talks, class_name: "Talk"

  validates :name, presence: true, length: { in: 1..100 }
  validates :slug, presence: true
  validates :avatar, blob: { content_type: ["image/png", "image/jpg", "image/jpeg"], size_range: 0..2.megabytes }

  before_validation(on: :create) do
    self.slug = self.name.parameterize
  end

  def merge_with(disposable)
    talks << disposable.talks
    disposable.delete
  end
end
