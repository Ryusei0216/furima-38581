class Item < ApplicationRecord

    #バリデーション
    validates :item_name,     {presence: true, presence:{message: "can't be blank"}}
    validates :description,   {presence: true, presence:{message: "can't be blank"}}   
    validates :price,         presence: true
    validates :price,         numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999,message: "is Out of setting range"}
    validates :price,         numericality: {only_integer:true, message: "is not Half-width number"}
    validates :category_id,   numericality: {other_than:1, message: "can't be blank"}
    validates :status_id,     numericality: {other_than:1, message: "can't be blank"}
    validates :charge_id,     numericality: {other_than:1, message: "can't be blank"}
    validates :prefecture_id, numericality: {other_than:1, message: "can't be blank"}  
    validates :day_id,        numericality: {other_than:1, message: "can't be blank"}
    validates :image,         {presence: true, presence:{message: "can't be blank"}}

    #アソシエーション
    belongs_to       :user
    has_one          :purchase_record
    has_one_attached :image

    #ActiveHash
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :charge
    belongs_to :prefecture
    belongs_to :day

end
