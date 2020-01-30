class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_image, dependent: :destroy
  has_many :post_comments, dependent: :destroy #1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :favorites, dependent: :destroy
end
