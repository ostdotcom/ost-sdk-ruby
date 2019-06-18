require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class UsersTest < Test::Unit::TestCase

  def webhooks_service
    @webhooks_service ||= Config::OST_SDK.services.webhooks
  end

  def test_webhooks_create
    result = webhooks_service.create({
                                      topics: ['transactions/initiate', 'transactions/success'],
                                      url: 'https://testingWebhooks.com'
                                     })
    puts "result=>#{result}" unless result["success"]
    webhook_id = result["data"]["webhook"]["id"]
    webhooks_get(webhook_id)
    webhooks_get_all
    webhooks_update(webhook_id)
    webhooks_delete(webhook_id)
    assert_equal(result["success"], true)
  end

  def webhooks_get(webhook_id)
    result = webhooks_service.get({
                                    webhook_id: webhook_id
                                  })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def webhooks_get_all
    result = webhooks_service.get_list()
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def webhooks_update(webhook_id)
    result = webhooks_service.update({
                                         webhook_id: webhook_id,
                                         topics: ['transactions/initiate', 'transactions/success', 'transactions/failure'],
                                         status: 'inactive'
                                       })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def webhooks_delete(webhook_id)
    result = webhooks_service.delete({
                                       webhook_id: webhook_id,
                                     })
    puts "result=>#{result}" unless result["success"]
    assert_equal(result["success"], true)
  end

  def test_webhooks_verify_signature
    data = {}
    data[:hello] = 'hello'
    result = webhooks_service.verify_signature({
                                                 version: "2",
                                                 webhook_secret: "mySecret",
                                                 request_timestamp: "1559902637",
                                                 signature: "2c56c143550c603a6ff47054803f03ee4755c9c707986ae27f7ca1dd1c92a824",
                                                 stringified_data: data.to_json
                                     })
    puts "result=>#{result}" unless result
    assert_equal(result, true)
  end

end
