# == Schema Information
#
# Table name: links
#
#  id           :bigint           not null, primary key
#  lookup_code  :string
#  original_url :string
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#
class Link < ApplicationRecord
  belongs_to :user
  validates_presence_of :lookup_code, :original_url, :title
  validates_uniqueness_of :lookup_code
  validate :original_url_format

  def original_url_format
    uri = URI.parse(original_url || "")
    if uri.host.nil?
      errors.add(:original_url, "Invalid URL format")
    end
  end

  def shortened_url
    "http://localhost:3000/#{lookup_code}"
  end
end
