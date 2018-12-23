class Speaker < ApplicationRecord
  has_and_belongs_to_many :talks, class_name: "Talk"
  validates_presence_of :name, :slug
end
