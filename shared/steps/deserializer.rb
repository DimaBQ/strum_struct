
module Shared
  module Steps
    class Deserializer

      def call
        Strum::JsonDeserializer.call(input)
      end
    end
  end
end