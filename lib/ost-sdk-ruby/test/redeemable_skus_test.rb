require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class RedeemableSkusTest < Test::Unit::TestCase

  def redeemable_skus_service
    @redeemable_skus_service ||= Config::OST_SDK.services.redeemable_skus
  end

  def test_redeemable_skus_get
    result = redeemable_skus_service.get(redeemable_sku_id: Config::OST_KIT_REDEEMABLE_SKU_ID)
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def test_redeemable_skus_get_list
    result = redeemable_skus_service.get()
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

end