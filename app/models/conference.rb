class Conference < ApplicationRecord
  has_many :talks, class_name: "Talk"
end
