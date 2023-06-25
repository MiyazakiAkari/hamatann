class User < ApplicationRecord
    has_secure_password

    has_many :lessons, dependent: :destroy
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def mine?(object)
        id == object.user_id
    end
end
