# frozen_string_literal: true

module Telnyx
  class WhatsappContacts < APIResource
    extend Telnyx::APIOperations::Create
    RESOURCE_PATH = "whatsapp_contacts".freeze
  end
end
