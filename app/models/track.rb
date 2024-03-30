class Track < ApplicationRecord
  has_one_attached :filename

  before_save :setting_title

  def setting_title
    raise "Cannot set title" unless self.filename.attached?
    title = sanitize_title(self.filename.filename.base)
    self.title = title
  end

  private

  def sanitize_title(text)
    # remove substr between [ ] in title and remove all withspaces
    # or everithing between parantheses

    text = text.gsub(/\[.*?\]/, '').strip
    text.gsub(/\(.*?\)/, '').strip
  end
end
