class Admin::SpeakersController < AdminController
  THRESHOLD = 5

  def index
    @speakers = Speaker.all
  end

  def levenshtein
    items = Speaker.all
    field = params[:field] || "name"

    by_size = items.group_by { |s| s.name.length }
    pairs = []
    (0..(by_size.keys.size - 1)).each do |k|
        interesting_values = []
        ((-[k, THRESHOLD - 1].min)..0).each do |p|
            interesting_values << by_size[by_size.keys.sort[k + p]]
        end
        (0..interesting_values.length - 1).each do |o|
            (0..(interesting_values[o].length - 1)).each do |i|
                d = 0
                ((i+1)..(interesting_values[interesting_values.length - 1].length - 1)).each do |j|
                    p1 = interesting_values[o][i]
                    p2 = interesting_values[interesting_values.length - 1][j]
                    d = Edits::Levenshtein.distance_with_max(p1.levenshtein_name, p2.levenshtein_name, THRESHOLD + 1)
                    pairs << OpenStruct.new(item1: p1, item2: p2, distance: d) if d < THRESHOLD
                end
            end
        end
    end
    pairs.sort_by!(&:distance)

    @pairs = pairs
  end

  def merge
    permanent = Speaker.find(params[:id])
    disposable = Speaker.find(params[:other])
    permanent.merge_with(disposable)
    render plain: 'ok'
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
