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
                                     user_id: Config::OST_SDK::USER_ID,
                                     address: '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E',
                                     api_signer_address: '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455',
                                     device_uuid: '593a967f-87bd-49a6-976c-52edf46c4df4',
                                     device_name: 'Iphone S'
                                 })
    assert_equal(result.success?, true)
  end

  def test_transactions_get
    result = transactions_service.get({
                                     user_id: Config::OST_SDK::USER_ID,
                                     transaction_id: Config::OST_SDK::TRANSACTION_ID
                                 })
    assert_equal(result.success?, true)
  end

  def test_transactions_get_list
    result = transactions_service.get({
                                     user_id: Config::OST_SDK::USER_ID
                                 })
    assert_equal(result.success?, true)
  end

end