class ShippingAddress < ApplicationRecord
  #アソシエーション
  belongs_to :purchase_record
end
