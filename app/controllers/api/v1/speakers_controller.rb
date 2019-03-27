module Api
  module V1
    class SpeakersController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        speakers = Speaker.all.map { |speaker|
          {
            slug: speaker.slug,
            name: speaker.name,
            avatar_url: speaker.avatar.attachment ? url_for(speaker.avatar.attachment) : "http://confy-assets.wecode.io/speakers/generic-speaker.png"
          }
        }
        respond_with speakers.to_json
      end

      def show
        speaker = Speaker.find_by(slug: params[:slug])
        x = {
          slug: speaker.slug,
          name: speaker.name,
          avatar_url: speaker.avatar.attachment ? url_for(speaker.avatar.attachment) : "http://confy-assets.wecode.io/speakers/generic-speaker.png",
          talks: speaker.talks.map do |talk|
            {
              title: talk.title,
              slug: talk.slug,
              description: talk.title,
              video_thumbnail: talk.video_thumbnail,
              conference: {
                title: talk.conference.title,
                slug: talk.conference.slug,
                image_url: talk.conference.image.attachment ? url_for(talk.conference.image.attachment) : "images/conference.png"
              },
            }
          end,
        }
        respond_with x.to_json
      end
    end
  end
end
