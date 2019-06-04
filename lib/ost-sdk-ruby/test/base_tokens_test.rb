require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class BaseTokensTest < Test::Unit::TestCase

  def base_tokens_service
    @base_tokens_service ||= Config::OST_SDK.services.base_tokens
  end

  def test_base_tokens_get
    result = base_tokens_service.get()
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true )
  end

end