class Student < ApplicationRecord
    belongs_to :instructor

    attribute :name, presence: true
    attribute :age, numericality: {greater_than_or_equal_to: 18}
end