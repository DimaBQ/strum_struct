# frozen_string_literal: true

module Shared
  module CRUD
    module Users
      # Strum service
      # You service description here...
      class Create
        include Strum::Service
    
        def call
          if (user = User.new(input)).valid?
            user.save
            output(user)
          else
            add_errors(user.errors)
          end
        end
    
        def audit
          # required(:key1, :key2)
        end
      end
    end
  end
end
