require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class TransactionsTest < Test::Unit::TestCase

  def transactions_service
    @transactions_service ||= Config::OST_SDK.services.transactions
  end

  def test_transactions_execute
    result = transactions_service.execute({
                                     user_id: Config::OST_KIT_COMPANY_USER_ID,
                                     to: Config::OST_KIT_RULE_ADDRESS,
                                     raw_calldata: {
                                         method: "directTransfers",
                                         parameters: [[Config::OST_KIT_USER2_TOKEN_HOLDER_ADDRESS],[1]]
                                     }.to_json
                                 })

    assert_equal(result["success"], true)
  end

  def test_transactions_get
    result = transactions_service.get({
                                     user_id: Config::OST_KIT_USER_ID,
                                     transaction_id: Config::OST_KIT_TRANSACTION_ID
                                 })
    assert_equal(result["success"], true)
  end

  def test_transactions_get_list
    result = transactions_service.get_list({
                                     user_id: Config::OST_KIT_COMPANY_USER_ID
                                 })
    assert_equal(result["success"], true)
  end

end