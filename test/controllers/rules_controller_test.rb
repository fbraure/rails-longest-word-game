require 'test_helper'

class RulesControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get rules_add_url
    assert_response :success
  end

  test "should get del" do
    get rules_del_url
    assert_response :success
  end

end
