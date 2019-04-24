class House < ActiveRecord::Base
    has_many :persons,
        primary_key: :class 
        foreign_key: :house_id,
        class_name: :Person
         
    
end