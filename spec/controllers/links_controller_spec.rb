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
require "rails_helper"

RSpec.describe LinksController, type: :Api::V1::ApiController   do

  it "can shorten a link provided by a user" do
    url = "https://www.favoritewebsite.com/articles/how-to-cook"


    user = User.create(email: 'admin@example.com', password: 'password')
    post :create, :params => { link: { original_url: url }, user: user}
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.lookup_code.length).to eq(4)
    expect(link.persisted?).to be(true)

    expect(response)
  end

end
