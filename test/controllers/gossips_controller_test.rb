require 'test_helper'

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get find" do
    get gossips_find_url
    assert_response :success
  end

end
