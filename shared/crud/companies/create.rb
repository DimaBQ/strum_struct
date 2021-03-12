# frozen_string_literal: true

module Companies
  # Strum service
  # You service description here...
  class Create
    include Strum::Service

    def call
      if (company = Company.new(input)).valid?
        company.save
        output(company)
      else
        add_errors(company.errors)
      end
    end

    def audit
      # required(:key1, :key2)
    end
  end
end
