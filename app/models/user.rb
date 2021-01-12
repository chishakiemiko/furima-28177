class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana,:birth_date, presence: true #空では登録できない
  validates :email,:password,:password_confirmation, presence: true 
  

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]/}
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    # 半角英字数字のみ許可する
    validates :password, format: {with: /\A[a-z0-9]+\z/i}
    #文字数についてパスワード６文字以上
    validates :password, length: { minimum: 6 }
    # VALID_PASSWORD_REGEX =/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
                          # /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}$/i
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates_format_of :password, with: PASSWORD_REGEX
    #emailは一意性
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i
    validates :email, uniqueness: true

  end       
end