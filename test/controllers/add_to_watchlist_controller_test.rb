require 'test_helper'

class AddToWatchlistControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get add_to_watchlist_update_url
    assert_response :success
  end

end
