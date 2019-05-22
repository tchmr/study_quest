require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get records_create_url
    assert_response :success
  end

end
