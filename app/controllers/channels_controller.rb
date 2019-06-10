class ChannelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def show
    @videos = Video.where(channel: @channel)
  end

  def index
    @channels = policy_scope(Channel)
  end

  def new
    @channel = Channel.new
    authorize @channel
  end

  def create
    @channel = Channel.new(new_channel_params)
    authorize @channel
    yt_channel = Yt::Channel.new id: @channel.yt_id
    if yt_channel.snippets.any?
      @channel.name = yt_channel.title
      @channel.description = yt_channel.description
      @channel.thumbnail_url = yt_channel.thumbnail_url
      @channel.published_at = yt_channel.published_at
    else
      return render :new, notice: "Channel's id isn't valid."
    end

    @channel.user = current_user

    if @channel.save
      redirect_to @channel, notice: 'Channel was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @channel.update(edit_channel_params)
      render :show, status: :ok, location: @channel
    else
      render :edit
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private

  def set_channel
    @channel = Channel.find(params['id'])
    authorize @channel
  end

  def new_channel_params
    params.require(:channel).permit(:yt_id)
  end

  def edit_channel_params
    params.require(:channel).permit(:public, :description)
  end

end
