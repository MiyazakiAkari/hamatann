class User < ApplicationRecord
    has_secure_password

    def mine?(object)
        id == object.user_id
    end
end
