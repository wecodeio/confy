class Admin::SpeakersController < AdminController
    def index
        @speakers = Speaker.all
    end

    def new
        @speaker = Speaker.new
    end

    def create
        Speaker.create(params[:speaker].permit(:full_name))
        redirect_to admin_speakers_path
    end

    def edit
        @speaker = Speaker.find(params[:id])
    end

    def update
        speaker = Speaker.find(params[:id])
        speaker.update(params[:speaker].permit(:full_name))
        redirect_to admin_speakers_path
    end

    def destroy
        speaker = Speaker.find(params[:id])
        speaker.destroy

        redirect_to admin_speakers_path
    end

end