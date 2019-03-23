class Admin::TalksController < AdminController
  def index
    @conference = Conference.find(params[:conference_id])
    @talks = @conference.talks
  end

  def edit
    @conference = Conference.find(params[:conference_id])
    @speakers = Speaker.all.map { |speaker|
      {
        id: speaker.id,
        name: speaker.name
      }
    }
    @talks = @conference.talks.map { |talk|
      {
        id: talk.id,
        title: talk.title,
        video_url: talk.video_url,
        speakers: talk.speakers.map { |speaker|
          {
            id: speaker.id,
            name: speaker.name
          }
        },
        new_speakers: [],
        _destroy: nil
      }
    }
  end

  def update
    @conference = Conference.find(params[:conference_id])
    @conference.update_attributes(conference_params)

    params[:conference][:talks_attributes].each do |talk_params|
      if talk_params[1][:new_speakers]
        talk_params[1][:new_speakers].each do |new_speaker_name|
          Speaker.create(name: new_speaker_name, slug: ActiveSupport::Inflector.parameterize(new_speaker_name))
          # TODO: collisions!
        end
      end
    end
    # automagically associate them to talks?

    redirect_to edit_admin_conference_talks_path(@conference)
  end

  private

    def conference_params
      params.require(:conference).permit(
        talks_attributes: [:id, :title, :video_url, :_destroy, :deleted_at, speaker_ids: [],
          speakers_attributes: [:id, :name, :slug]])
    end
end
