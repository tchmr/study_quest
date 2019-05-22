require 'test_helper'

class QuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quests_index_url
    assert_response :success
  end

  test "should get create" do
    get quests_create_url
    assert_response :success
  end

  test "should get show" do
    get quests_show_url
    assert_response :success
  end

end
