module Api
  module V1
    class SpeakersController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        speakers = Speaker.all
        respond_with speakers.to_json(only: [:slug, :name])
      end

    end
  end
end
