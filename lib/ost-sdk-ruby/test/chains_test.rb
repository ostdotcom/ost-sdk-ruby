require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class ChainsTest < Test::Unit::TestCase

  def chains_service
    @chains_service ||= Config::OST_SDK.services.chains
  end

  def test_chains_get
    result = chains_service.get(chain_id: Config::OST_SDK::CHAIN_ID)
    assert_equal(result.success?, true )
  end

end