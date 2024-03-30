class Api::V1::TracksController < ApplicationController
  before_action :track, only: [:destroy]

  def index
    @tracks = Track.all

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

  end

  private

  def track_params
    params.permit(:id ,:filename, :title)
  end

  def track
    @track = Track.find(params[:id])
  end
end
