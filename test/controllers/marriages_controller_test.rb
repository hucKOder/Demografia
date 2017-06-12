require 'test_helper'

class MarriagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marriages_index_url
    assert_response :success
  end

end
