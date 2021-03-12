# frozen_string_literal: true

module Shared
  module CRUD
    module Companies
      # Strum service
      # You service description here...
      class Find
        include Strum::Service
    
        def call
          if (companies = Companies::Search(input)).count.eql?(1)
            output(companies.first)
          elsif companies.count > 1
            add_error(:company, :criteria_wrong)
          else
            add_error(:company, :not_found)
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

