class User < ActiveRecord::Base
has_many :workouts 
    validates :name, presence: true 
end 