class Item < ApplicationRecord

    #バリデーション
    validates :item_name,     presence: true
    validates :description,   presence: true   
    validates :user,          presence: true                 
    validates :price,         {presence: true, format: {with: /\A[0-9]+\z/ }}
    validates :category_id,   {presence: true, numericality: {other_than:1, message: "can't be blank"}}
    validates :status_id,     {presence: true, numericality: {other_than:1, message: "can't be blank"}}         
    validates :charge_id,     {presence: true, numericality: {other_than:1, message: "can't be blank"}}       
    validates :prefecture_id, {presence: true, numericality: {other_than:1, message: "can't be blank"}}    
    validates :day_id,        {presence: true, numericality: {other_than:1, message: "can't be blank"}}
    validates :image,         presence: true

    #アソシエーション
    belongs_to :user
    has_one_attached :image

    #ActiveHash
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :charge
    belongs_to :prefecture
    belongs_to :day

end
