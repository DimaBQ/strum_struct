# frozen_string_literal: true

require "fast_jsonapi"

# Strum service
# You model description here...
module Shared
  module Serializers
    class CompanySerializer
      include FastJsonapi::ObjectSerializer
      set_key_transform :dash
      attributes :id
    end
  end
end
