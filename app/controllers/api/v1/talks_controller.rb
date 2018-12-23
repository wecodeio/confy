module Api
  module V1
    class TalksController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def show
        talk = Talk.find_by(slug: params[:slug])
        x = {
          title: talk.title,
          slug: talk.slug,
          description: talk.title,
          video_id: talk.video_id,
          speakers: talk.speakers.map do |speaker|
            {
              slug: speaker.slug,
              name: speaker.name,
            }
          end,
          conference: {
            slug: talk.conference.slug,
            title: talk.conference.title,
          },
        }
        respond_with x.to_json
      end
    end
  end
end
