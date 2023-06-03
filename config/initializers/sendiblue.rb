# SibApiV3Sdk.configure do |config|
#   config.api_key['api-key'] = ""
# end
require 'sib-api-v3-sdk'

# Setup authorization
SibApiV3Sdk.configure do |config|
  # Configure API key authorization: api-key
  config.api_key['api-key'] = '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'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api-key'] = 'Bearer'
end

api_instance = SibApiV3Sdk::AccountApi.new

begin
  #Get your account informations, plans and credits details
  result = api_instance.get_account
  puts result
rescue SibApiV3Sdk::ApiError => e
  puts "Exception when calling AccountApi->get_account: #{e}"
end