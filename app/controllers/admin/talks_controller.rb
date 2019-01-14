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
        _destroy: nil
      }
    }
  end

  def update
    @conference = Conference.find(params[:conference_id])
    @conference.update_attributes(conference_params)

    redirect_to edit_admin_conference_talks_path(@conference)
  end

  private

    def conference_params
      params.require(:conference).permit(
        talks_attributes: [:id, :title, :video_url, :_destroy, :deleted_at, speaker_ids: []])
    end
end
