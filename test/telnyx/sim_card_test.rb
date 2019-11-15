# frozen_string_literal: true

require_relative "../test_helper"

module Telnyx
  class SimCardTest < Test::Unit::TestCase
    should "retrieve sim card" do
      sim = Telnyx::SimCard.retrieve "123"
      assert_requested(:get, "#{Telnyx.api_base}/v2/sim_cards/123")
      assert_kind_of Telnyx::SimCard, sim
    end

    should "list sim cards" do
      simlist = Telnyx::SimCard.list
      assert_requested(:get, "#{Telnyx.api_base}/v2/sim_cards")
      assert_kind_of Telnyx::ListObject, simlist
    end

    should "save sim card" do
      sim = Telnyx::SimCard.retrieve "123"
      sim.save
      assert_requested(:get, "#{Telnyx.api_base}/v2/sim_cards/123")
    end

    should "register sim card" do
      Telnyx::SimCard.register(registration_codes: %w[1234567890 123456332601])
      assert_requested(:post, "#{Telnyx.api_base}/v2/actions/register/sim_cards")
    end

    context "actions" do
      should "deactivate" do
        stub_request(:get, "#{Telnyx.api_base}/v2/sim_cards/123")
          .to_return(body: JSON.generate(data: { record_type: "sim_card", id: "123" }))

        stub = stub_request(:post, "#{Telnyx.api_base}/v2/sim_cards/123/actions/deactivate")
               .to_return(body: JSON.generate(errors: []), status: 202)

        sim = Telnyx::SimCard.retrieve "123"
        sim.deactivate
        assert_requested stub
      end

      should "activate" do
        stub_request(:get, "#{Telnyx.api_base}/v2/sim_cards/123")
          .to_return(body: JSON.generate(data: { record_type: "sim_card", id: "123" }))

        stub = stub_request(:post, "#{Telnyx.api_base}/v2/sim_cards/123/actions/activate")
               .to_return(body: JSON.generate(errors: []), status: 202)

        sim = Telnyx::SimCard.retrieve "123"
        sim.activate
        assert_requested stub
      end
    end
  end
end
