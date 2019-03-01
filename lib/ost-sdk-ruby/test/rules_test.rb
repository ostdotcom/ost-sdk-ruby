require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class RulesTest < Test::Unit::TestCase

  def rules_service
    @rules_service ||= Config::OST_SDK.services.rules
  end

  def test_rules_get
    result = rules_service.get()
    assert_equal(result.success?, true )
  end

end