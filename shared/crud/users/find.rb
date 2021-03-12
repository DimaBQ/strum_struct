# frozen_string_literal: true

module Shared
  module CRUD
    module Users
      # Strum service
      # You service description here...
      class Find
        include Strum::Service
    
        def call
          if (users = Users::Search(input)).count.eql?(1)
            output(users.first)
          elsif users.count > 1
            add_error(:user, :criteria_wrong)
          else
            add_error(:user, :not_found)
          end
        end
    
        def audit
          @input = @input.slice(:id)
          required(:id)
        end
      end
    end
  end
end

