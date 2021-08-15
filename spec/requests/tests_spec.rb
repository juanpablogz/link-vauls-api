# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  test       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe "Tests", type: :request do
  describe "GET /tests" do
    it "works! (now write some real specs)" do
      get tests_path
      expect(response).to have_http_status(200)
    end
  end
end
