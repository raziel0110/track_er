class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url, :content_type, :blob

  def url
    # url_for(object.filename)
    # Rails.application.routes.url_helpers.rails_blob_url(object.filename, only_path: true)
    rails_blob_url(object.filename)
  end

  def content_type
    object.filename.content_type
  end

  def blob
    object.filename.blob
  end
end
