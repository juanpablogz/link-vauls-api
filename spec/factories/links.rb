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
FactoryBot.define do
  factory :link do
    lookup_code { "MyString" }
    original_url { "MyString" }
    user { nil }
  end
end
