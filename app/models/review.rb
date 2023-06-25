class Review < ApplicationRecord
    belongs_to :user
    belongs_to :lesson

    validates :title, presence: true
    validates :body, presence: true
    validates :lesson_id, uniqueness: { scope: :user_id, message: "は同じ授業に対して一人一つしか投稿できません" }
end
