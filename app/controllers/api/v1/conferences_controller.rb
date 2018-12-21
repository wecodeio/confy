module Api
  module V1
    class ConferencesController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        conferences = [
          { title: 'RubyConf Argentina 2013', year: 2013, slug: 'rubyconfar' },
          { title: 'RubyConf Argentina 2014', year: 2014, slug: 'rubyconfar' },
          { title: 'RubyConf Uruguay 2013', year: 2013, slug: 'rubyconfuy' }
        ]
        respond_with conferences.to_json
      end

    end
  end
end
