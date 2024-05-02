class Api::V1::TracksController < ApplicationController
  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  before_action :track, only: [:destroy]

  def index
    @tracks = Track.sorting_latest

    render json: @tracks, each_serializer: TrackSerializer, status: :ok
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      render json: {url: url_for(@track.filename), title: @track.title}, status: :created
    else
      render json: {message: 'Something went wrong'}, status: :unprocessable_entity
    end
  end

  def destroy
    @track.destroy

    render json: {message: 'Song deleted'}, status: :ok
  end

  private

  def track_params
    params.permit(:id ,:filename, :title)
  end

  def track
    @track = Track.find(params[:id])
  end
end
