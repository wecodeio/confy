class Admin::ConferencesController < AdminController
  def index
    @conferences = Conference.all
  end

  def new
    @conference = Conference.new
    render "form"
  end

  def create
    @conference = Conference.new(conference_params)
    if @conference.save
      redirect_to admin_conferences_path
    else
      render "form"
    end
  end

  def edit
    @conference = Conference.find(params[:id])
    render "form"
  end

  def update
    @conference = Conference.find(params[:id])
    if @conference.update(conference_params)
      redirect_to admin_conferences_path
    else
      render "form"
    end
  end

  def destroy
    conference = Conference.find(params[:id])
    conference.destroy

    redirect_to admin_conferences_path
  end

  private

    def conference_params
      params[:conference].permit(:title, :slug, :description, :start_date, :end_date, :place, :url, :image)
    end
end
