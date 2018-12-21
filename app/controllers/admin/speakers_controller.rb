class Admin::SpeakersController < AdminController
  def index
    @speakers = Speaker.all
  end

  def new
    @speaker = Speaker.new
    render "form"
  end

  def create
    Speaker.create(speaker_params)
    redirect_to admin_speakers_path
  end

  def edit
    @speaker = Speaker.find(params[:id])
    render "form"
  end

  def update
    speaker = Speaker.find(params[:id])
    speaker.update(speaker_params)
    redirect_to admin_speakers_path
  end

  def destroy
    speaker = Speaker.find(params[:id])
    speaker.destroy

    redirect_to admin_speakers_path
  end

  private

  def speaker_params
    params[:speaker].permit(:name, :slug)
  end
end
