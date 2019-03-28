class Config

  API_BASE_URL = ENV['OST_KIT_API_ENDPOINT']
  API_KEY = ENV['OST_KIT_API_KEY']
  API_SECRET = ENV['OST_KIT_API_SECRET']
  OST_SDK = OSTSdk::Saas::Services.new({api_key: API_KEY, api_secret: API_SECRET,
                                        api_base_url: API_BASE_URL, config: {timeout: 60}, api_spec: false})

  OST_KIT_COMPANY_USER_ID = ENV['OST_KIT_COMPANY_USER_ID']
  OST_KIT_AUX_CHAIN_ID = ENV['OST_KIT_AUX_CHAIN_ID']
  OST_KIT_TRANSACTION_ID = ENV['OST_KIT_TRANSACTION_ID']
  OST_KIT_USER_ID = ENV['OST_KIT_USER_ID']
  OST_KIT_USER_DEVICE_ADDRESS = ENV['OST_KIT_USER_DEVICE_ADDRESS']
  OST_KIT_SESSION_ADDRESS = ENV['OST_KIT_SESSION_ADDRESS']
  OST_KIT_RULE_ADDRESS = ENV['OST_KIT_RULE_ADDRESS']
  OST_KIT_USER2_TOKEN_HOLDER_ADDRESS = ENV['OST_KIT_USER2_TOKEN_HOLDER_ADDRESS']
  OST_KIT_RECOVERY_OWNER_ADDRESS = ENV['OST_KIT_RECOVERY_OWNER_ADDRESS']
end