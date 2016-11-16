require 'test_helper'

class CodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get codes_index_url
    assert_response :success
  end

end
