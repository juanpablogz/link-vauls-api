# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  test       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Test < ApplicationRecord
end
