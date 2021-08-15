# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  test       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :test do
    test { "MyString" }
  end
end
