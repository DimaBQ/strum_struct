
module Shared
    module Steps
      class UserCompanyFind
  
        def audit
          # Some code here
        end
  
        def call
        [
            Thread.new { define_user(input[:user_id]) },
            Thread.new { define_company(input[:company_id]) }
        ].each(&:join)
        end

        def define_user(id)
          @user = Shared::CRUD::Users::Find.call(id)
        end

        def define_company(id)
          @company = Shared::CRUD::Companies::Find.call(id)
        end
      end
    end
  end