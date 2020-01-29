class PostImagesController < ApplicationController
	def new #画像の投稿画面を表示
		@post_image = PostImage.new #インスタンス変数に空のインスタンスを渡して、画像の投稿ができるようにします。
	end
	def create #投稿画像を保存,投稿データを保存,投稿データを保存するには、Strong Parametersも必要
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		@post_image.save
		redirect_to post_images_path
	end
	def index #投稿画像のリストを表示する画面を作る
		@post_images = PostImage.all
	end
	def show #投稿画像の詳細を表示する画面を作る
		@post_image = PostImage.find(params[:id])
	end
	private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
