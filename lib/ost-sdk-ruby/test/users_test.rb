require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class UsersTest < Test::Unit::TestCase

  def users_service
    @users_service ||= Config::OST_SDK.services.users
  end

  def test_users_create
    result = users_service.create()
    assert_equal(result["success"], true)
  end

  def test_users_get
    result = users_service.get({
                                   id: Config::OST_KIT_COMPANY_USER_ID
                               })
    assert_equal(result["success"], true)
  end

  def test_users_get_list
    result = users_service.get_list()
    assert_equal(result["success"], true)
  end

end