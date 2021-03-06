# frozen_string_literal: true

require "controllers/helpers/validators"

module Controllers
  class CreateUserSubscription
    include Strum::Service

    def call
      Strum::Pipe.call(
        Shared::Steps::Deserializer,
        Pipes::CreateUserSubscriptionSteps::SomePrepareService,
        Pipes::CreateUserSubscriptionSteps::Step1,
        Pipes::CreateUserSubscriptionSteps::Step2,
        Shared::Steps::UserCompanyFind,
        Pipes::CreateUserSubscriptionSteps::Step4,
        [Shared::Steps::Serializer, input: { klass: UserSerializer, from_key: :user }],
        input: input) do |m|
          m.success { |result| output(result) }
          m.failure { |errors| add_errors(errors) } 
        end
    end
  end
end
