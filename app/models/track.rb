class Track < ApplicationRecord
  has_one_attached :filename, dependent: :purge

  before_save :setting_title

  scope :sorting_latest, -> { order(created_at: :desc) }

  def setting_title
    raise "Cannot set title" unless self.filename.attached?

    self.title = sanitize_title(self.filename.filename.base)
  end

  private

  def sanitize_title(text)
    # remove substr between [ ] in title and remove all withspaces
    # or everithing between parantheses

    text = text.gsub(/\[.*?\]/, '').strip
    text.gsub(/\(.*?\)/, '').strip
  end
end
