class Event < ActiveRecord::Base
    belongs_to :user #through: :attendances   
    has_many :attendances
end