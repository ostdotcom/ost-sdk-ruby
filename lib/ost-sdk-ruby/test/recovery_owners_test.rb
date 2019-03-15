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
                                             user_id: Config::OST_KIT_USER_ID,
                                             recovery_owner_address: Config::OST_KIT_RECOVERY_OWNER_ADDRESS
                                         })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true )
  end

end