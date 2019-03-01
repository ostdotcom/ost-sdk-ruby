require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class BalanceTest < Test::Unit::TestCase

  def balance_service
    @balance_service ||= Config::OST_SDK.services.balance
  end

  def test_balance_get
    result = balance_service.get(user_id: Config::OST_KIT_COMPANY_USER_ID)
    assert_equal(result["success"], true )
  end

end