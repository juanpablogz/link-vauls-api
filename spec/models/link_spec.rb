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
require 'rails_helper'

RSpec.describe Link, type: :model do
  it "it valid if has an original URL and lookup code" do
  user = User.create!(email: 'admin@example.com', password: 'password')
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567",
      user_id: user.id
    )
    expect(link.valid?).to be(true)
  end
  it "is invalid if the URL is not formatted properly" do
    link = Link.new(
      original_url: "asdasdsadsdas",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end
  it "is ivalid if does not have a lookup code" do
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
    )
    expect(link.valid?).to be(false)
  end

  it "is ivalid if does not have a lookup original URL" do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "it invalid if the lookup code already exists" do
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567"
    )
    link.save

    link_2 = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-bake",
      lookup_code: "1234567"
    )
    
    expect(link_2.valid?).to be(false)
  end
end
