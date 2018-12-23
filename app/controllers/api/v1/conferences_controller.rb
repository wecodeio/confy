module Api
  module V1
    class ConferencesController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        conferences = Conference.all
        respond_with conferences.to_json(only: [:title, :year, :slug])
      end

      def show
        conference = Conference.find_by(slug: params[:slug])
        x = {
          title: conference.title,
          slug: conference.slug,
          description: conference.description,
          dates: "12-14 Mar 2014",
          place: conference.place,
          url: conference.url,
          talks: conference.talks.map do |talk|
            {
              title: talk.title,
              slug: talk.slug,
              description: talk.title,
              video_thumbnail: talk.video_thumbnail,
              speakers: talk.speakers.map do |speaker|
                {
                  slug: speaker.slug,
                  name: speaker.name,
                }
              end,
            }
          end,
        }
        respond_with x.to_json
      end
    end
  end
end
