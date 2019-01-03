class Admin::SpeakersController < AdminController
  def index
    @speakers = Speaker.all
  end

  def new
    @speaker = Speaker.new
    render "form"
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      redirect_to admin_speakers_path
    else
      render "form"
    end
  end

  def edit
    @speaker = Speaker.find(params[:id])
    render "form"
  end

  def update
    @speaker = Speaker.find(params[:id])
    if @speaker.update(speaker_params)
      redirect_to admin_speakers_path
    else
      render "form"
    end
  end

  def destroy
    speaker = Speaker.find(params[:id])
    speaker.destroy

    redirect_to admin_speakers_path
  end

  private

    def speaker_params
      params[:speaker].permit(:name, :slug, :avatar)
    end
end
