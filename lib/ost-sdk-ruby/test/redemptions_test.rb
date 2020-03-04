require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class RedemptionsTest < Test::Unit::TestCase

  def redemptions_service
    @redemptions_service ||= Config::OST_SDK.services.redemptions
  end

  def test_redemptions_get
    result = redemptions_service.get(user_id: Config::OST_KIT_USER_ID, redemption_id: Config::OST_KIT_REDEMPTION_ID)
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true )
  end

  def test_redemptions_get_list
    result = redemptions_service.get_list(user_id: Config::OST_KIT_USER_ID)
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true )
  end

end
