require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class PricePointsTest < Test::Unit::TestCase

  def price_points_service
    @price_points_service ||= Config::OST_SDK.services.price_points
  end

  def test_price_points_get
    result = price_points_service.get(chain_id: Config::OST_SDK::CHAIN_ID)
    assert_equal(result.success?, true )
  end

end