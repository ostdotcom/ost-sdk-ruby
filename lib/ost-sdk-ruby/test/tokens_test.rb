require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class TokensTest < Test::Unit::TestCase

  def tokens_service
    @tokens_service ||= Config::OST_SDK.services.tokens
  end

  def test_tokens_get
    result = tokens_service.get()
    assert_equal(result.success?, true )
  end

end