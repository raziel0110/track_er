class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url

  def url
    url_for(object.filename)
  end
end
