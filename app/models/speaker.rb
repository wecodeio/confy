class Speaker < ApplicationRecord
  validates_presence_of :name, :slug
end
