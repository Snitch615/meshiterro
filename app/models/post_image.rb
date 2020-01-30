class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image #画像アップ用のメソッド（attachment_field）を追加 #image_idから_idを除いた名前（image）を指定
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :shop_name, presence: true
	validates :image, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists? #このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。存在していればtrue、存在していなければfalseを返す
	end
end