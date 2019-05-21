class ChannelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    # @channels = Channel.all
    @channels = policy_scope(Channel)
  end

  def show
  end

  def new
    @channel = Channel.new
    authorize @channel
  end

  def edit
  end

  def create
    @channel = Channel.from_yt(channel_new_params["yt_id"])
    @channel.user = current_user
    authorize @channel

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @channel.update(channel_edit_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
      authorize @channel
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_new_params
      params.require(:channel).permit(:yt_id)
    end

    def channel_edit_params
      params.require(:channel).permit(:yt_id)
    end

end
