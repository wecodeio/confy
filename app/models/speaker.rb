class Speaker < ApplicationRecord
  has_many :talks, class_name: "Talk"
  validates_presence_of :name, :slug
end
