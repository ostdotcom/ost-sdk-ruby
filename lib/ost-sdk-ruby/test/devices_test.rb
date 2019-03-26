require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class DevicesTest < Test::Unit::TestCase

  def devices_service
    @devices_service ||= Config::OST_SDK.services.devices
  end

  def test_devices_create
    result = devices_service.create({
                                     user_id: Config::OST_KIT_USER_ID,
                                     address: "0x1ea365269a3e6c8fa492eca9a531bf#{Time.now.to_i}",
                                     api_signer_address: '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
                                 })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def test_devices_get
    result = devices_service.get({
                                     user_id: Config::OST_KIT_USER_ID,
                                     device_address: Config::OST_KIT_USER_DEVICE_ADDRESS
                                 })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def test_devices_get_list
    result = devices_service.get_list({
                                     user_id: Config::OST_KIT_USER_ID
                                 })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

end