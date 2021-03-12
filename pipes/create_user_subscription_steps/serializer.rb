
module Pipes
  module CreateUserSubscriptionSteps
    class Serializer

      def audit
         # Some code here
      end
  
      def call
        Shared::Serializers::UserSerializer.new(input[:user]).serializable_hash
      end
    end
  end
end