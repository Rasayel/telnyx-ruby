
# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class PhoneNumberRegulatoryRequirementTest < Test::Unit::TestCase
    should "be listable" do
      phone_number_reg_req = PhoneNumberRegulatoryRequirement.list
      assert_requested :get, "#{Telnyx.api_base}/v2/phone_number_regulatory_requirements"
      assert_kind_of PhoneNumberRegulatoryRequirement, phone_number_reg_req.first
    end
  end
end
