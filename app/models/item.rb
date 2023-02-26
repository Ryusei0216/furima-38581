class Item < ApplicationRecord
    validates :item_name,     presence: true
    validates :description,   presence: true   
    validates :user,          presence: true                 
    validates :price,         presence: true                
    validates :category_id,   presence: true         
    validates :status_id,     presence: true           
    validates :charge_id,     presence: true         
    validates :prefecture_id, presence: true     
    validates :day_id,        presence: true  
    belongs_to :user
    has_one_attached :image        
end
