class Instructor < ApplicationRecord
    has_many :students

    attribute :name, presence: true
end
