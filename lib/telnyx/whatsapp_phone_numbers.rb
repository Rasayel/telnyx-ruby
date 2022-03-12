# frozen_string_literal: true

module Telnyx
  class WhatsappPhoneNumbers < APIResource
    extend Telnyx::APIOperations::List
    include Telnyx::APIOperations::Save
    
    OBJECT_NAME   = "whatsapp_phone_number".freeze
    RESOURCE_PATH = "whatsapp_phone_numbers".freeze
  end
end
