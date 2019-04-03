class Talk < ApplicationRecord
  has_and_belongs_to_many :speakers, class_name: "Speaker"
  belongs_to :conference, class_name: "Conference", foreign_key: "conference_id"

  accepts_nested_attributes_for :speakers

  before_validation(on: :create) do
    self.slug = self.title.parameterize
  end

  def video_id
    if video_url.include? "vimeo"
      "//player.vimeo.com/video/#{video_url.split("/").last}"
    else
      "//www.youtube.com/embed/#{video_url.split("=").last}"
    end
  end

  def video_thumbnail
    if video_url.include? "vimeo"
      result = Net::HTTP.get(URI.parse("http://vimeo.com/api/v2/video/#{video_url.split("/").last}.json"))
      if result.include? 'not found'
        "//via.placeholder.com/1080x720.png"
      else
        JSON.parse(result)[0]["thumbnail_large"]
      end
    else
      "//img.youtube.com/vi/#{video_url.split("=").last}/maxresdefault.jpg"
    end
  end
end
