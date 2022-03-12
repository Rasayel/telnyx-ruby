# frozen_string_literal: true

module Telnyx
  class WhatsappMessages < APIResource
    extend Telnyx::APIOperations::Create
    include Telnyx::APIOperations::Save
    
    OBJECT_NAME = "whatsapp_messages".freeze
    RESOURCE_PATH = "whatsapp_messages".freeze
  end
end
