class Talk < ApplicationRecord
  belongs_to :speaker, class_name: "Speaker", foreign_key: "speaker_id"
  belongs_to :conference, class_name: "Conference", foreign_key: "conference_id"

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
      JSON.parse(result)[0]["thumbnail_large"]
    else
      "//img.youtube.com/vi/#{video_url.split("=").last}/maxresdefault.jpg"
    end
  end
end
