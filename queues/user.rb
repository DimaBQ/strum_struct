# frozen_string_literal: true

require "logger"

module Queues
  class StrumStructApp

    from_queue "user",
               bindings: {
                 action: ["create/subscription"]
               }

    protected

    def action_create_subscription(payload)
      Controllers::CreateUserSubscription.call(payload) do |m|
        m.success { |result| result }
        m.failure { |errors| errors }
      end
    end
end
