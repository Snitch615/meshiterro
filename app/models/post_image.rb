class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image #画像アップ用のメソッド（attachment_field）を追加 #image_idから_idを除いた名前（image）を指定
end
