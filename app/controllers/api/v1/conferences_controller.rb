module Api
  module V1
    class ConferencesController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        conferences = Conference.all
        respond_with conferences.group_by { |conference|
          conference.start_date.year
        }.sort.reverse.map { |year_conference|
          {
            year: year_conference[0],
            conferences: year_conference[1].map { |conference|
              {
                title: conference.title,
                slug: conference.slug,
                description: conference.description,
                dates: "#{conference.start_date.day}-#{conference.end_date.strftime('%-d %b \'%y')}",
                place: conference.place,
                url: conference.url,
                talks: conference.talks.count
              }
            }
          }
        }.to_json
      end

      def show
        conference = Conference.find_by(slug: params[:slug])
        conference_presenter = {
          title: conference.title,
          slug: conference.slug,
          description: conference.description,
          dates: "#{conference.start_date.day}-#{conference.end_date.strftime('%-d %b \'%y')}",
          place: conference.place,
          url: conference.url,
          talks: conference.talks.map { |talk|
            {
              title: talk.title,
              slug: talk.slug,
              description: talk.title,
              video_thumbnail: talk.video_thumbnail,
              speakers: talk.speakers.map { |speaker|
                {
                  slug: speaker.slug,
                  name: speaker.name,
                }
              },
            }
          },
        }
        respond_with conference_presenter.to_json
      end
    end
  end
end
