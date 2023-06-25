class Lesson < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy

    validates :title, presence: true
    validates :course, presence: true
    validates :semester, presence: true
    validates :day, presence: true
    validates :time, presence: true
    validates :teacher, presence: true
end
