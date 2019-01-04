class Admin::TalksController < AdminController
  def index
    @conference = Conference.find(params[:conference_id])
    @talks = @conference.talks
  end

  def edit
    @conference = Conference.find(params[:conference_id])
    @talks = @conference.talks
  end

  def update
    5/0
  end

end
