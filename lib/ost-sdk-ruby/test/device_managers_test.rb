require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class DeviceManagersTest < Test::Unit::TestCase

  def device_managers_service
    @device_managers_service ||= Config::OST_SDK.services.device_managers
  end

  def test_device_managers_get
    result = device_managers_service.get(user_id: Config::OST_KIT_USER_ID)
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true )
  end

end