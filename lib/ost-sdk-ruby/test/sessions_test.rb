require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class SessionsTest < Test::Unit::TestCase

  def sessions_service
    @sessions_service ||= Config::OST_SDK.services.sessions
  end

  def test_sessions_get
    result = sessions_service.get({
                                     user_id: Config::OST_KIT_USER_ID,
                                     session_address: Config::OST_KIT_SESSION_ADDRESS
                                 })
    assert_equal(result["success"], true)
  end

  def test_sessions_get_list
    result = sessions_service.get_list({
                                     user_id: Config::OST_KIT_COMPANY_USER_ID
                                 })
    assert_equal(result["success"], true)
  end

end