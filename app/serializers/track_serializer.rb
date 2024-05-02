class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url, :content_type

  def url
    # url_for(object.filename)
    Rails.application.routes.url_helpers.blob_url(object.filename)
  end

  def content_type
    object.filename.content_type
  end
end
