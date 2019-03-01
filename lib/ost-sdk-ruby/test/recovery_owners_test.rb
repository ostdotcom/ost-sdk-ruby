require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class RecoveryOwnersTest < Test::Unit::TestCase

  def recovery_owners_service
    @recovery_owners_service ||= Config::OST_SDK.services.recovery_owners
  end

  def test_recovery_owners_get
    result = recovery_owners_service.get({
                                             user_id: Config::OST_SDK::USER_ID,
                                             recovery_owner_address: Config::OST_SDK::RECOVERY_OWNER_ADDRESS
                                         })
    assert_equal(result.success?, true )
  end

end