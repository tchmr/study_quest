require 'test_helper'

class EnemiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enemies_index_url
    assert_response :success
  end

  test "should get show" do
    get enemies_show_url
    assert_response :success
  end

end
