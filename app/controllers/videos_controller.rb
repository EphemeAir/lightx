class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_video, only: [:show, :edit, :update]


  def show
  end

  def index
    @videos = policy_scope(Video)
  end

  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(new_video_params)
    authorize @video
    yt_video = Yt::Video.new id: @video.yt_id
    if yt_video.snippets.any? && Channel.exists?(yt_id: yt_video.channel_id)
      @video.name = yt_video.title
      @video.channel = Channel.find_by(yt_id: yt_video.channel_id)
      @video.description = yt_video.description
      @video.thumbnail_url = yt_video.thumbnail_url
      @video.duration = yt_video.duration
      @video.captioned = yt_video.captioned?
      @video.published_at = yt_video.published_at
    else
      return render :new, notice: "Video's id isn't valid."
    end

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(edit_video_params)
      render :show, status: :ok, location: @video
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private

  def set_video
    @video = Video.find(params['id'])
    authorize @video
  end

  def new_video_params
    params.require(:video).permit(:yt_id)
  end

  def edit_video_params
    params.require(:video).permit(:public, :description)
  end

end
