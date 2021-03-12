
module Shared
  module Steps
    class DeserializerWrap

      def call
        Strum::JsonDeserializer.call(input)
      end
    end
  end
end