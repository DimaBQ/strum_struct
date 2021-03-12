# frozen_string_literal: true

Sequel.migration do
  change do
    extension(:constraint_validations)
    create_table(:users) do
      primary_key :id
      # code here ...
    end
  end
end
