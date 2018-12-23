module Api
  module V1
    class SpeakersController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        speakers = Speaker.all
        respond_with speakers.to_json(only: [:slug, :name])
      end

      def show
        speaker = Speaker.find_by(slug: params[:slug])
        x = {
          slug: speaker.slug,
          name: speaker.name,
          talks: speaker.talks.map do |talk|
            {
              title: talk.title,
              slug: talk.slug,
              description: talk.title,
              video_thumbnail: talk.video_thumbnail,
              conference: {
                title: talk.conference.title,
                slug: talk.conference.slug,
              },
            }
          end,
        }
        respond_with x.to_json
      end
    end
  end
end
