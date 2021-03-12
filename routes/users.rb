# frozen_string_literal: true

# Branch route /users
class StrumStructApp
  hash_branch "users" do |req| # rubocop: disable Metrics/BlockLength
    req.post(true) do
      Controllers::CreateUserSubscription.call(req.params) do |m|
        m.success { |result| result }
        m.failure { |errors| response.status = :unprocessable_entity; errors }
      end
    end
  end
end
