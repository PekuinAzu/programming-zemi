class User < ApplicationRecord
    has_many :tweets, dependent: :destroy
 #データを保存する前にメアドを小文字にする。
before_save { email.downcase! }
 #nameは必ず存在する。50文字以内
validates :name, presence: true, length: { maximum: 50 }
#メールアドレスのフォーマットを「正規表現」を使って指定
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
has_secure_password
validates :password, presence: true, length: { minimum: 6 }, allow_nil: true          
end

