# frozen_string_literal: true

module Telnyx
  class WhatsappBusinessAccounts < APIResource
    extend Telnyx::APIOperations::List
    extend Telnyx::APIOperations::NestedResource
    
    nested_resource_class_methods "phone_number",
                                  path:             "phone_numbers",
                                  operations:       [:list],
                                  instance_methods: { list: "phone_number" }
    
    OBJECT_NAME   = "whatsapp_business_account".freeze
    RESOURCE_PATH = "whatsapp_business_accounts".freeze
  end
end
