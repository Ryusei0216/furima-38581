class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, 
                :building,:phone_number, :user_id, :item_id, :purchase_record_id, :token
  #バリデーション              
  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :house_number
    validates :phone_number, length: { minimum:10, maximum: 11}, numericality: { only_integer: true}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  #保存処理
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_record_idには、変数purchase_recordのidと指定する
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                           house_number: house_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end