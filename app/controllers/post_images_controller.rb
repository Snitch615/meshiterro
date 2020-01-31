class PostImagesController < ApplicationController
	def new #画像の投稿画面を表示
		@post_image = PostImage.new #インスタンス変数に空のインスタンスを渡して、画像の投稿ができるようにします。
	end
	def create #投稿画像を保存,投稿データを保存,投稿データを保存するには、Strong Parametersも必要
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
		  redirect_to post_images_path
		else
		  render :new #render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。
		  #呼び出し先でインスタンス変数が使われていると、呼び出し元で定義されていなければエラーになるので注意が必要です。
		end
	end
	def index #投稿画像のリストを表示する画面を作る
		@post_images = PostImage.page(params[:page]).reverse_order
	end
	def show #投稿画像の詳細を表示する画面を作る
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end
	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy
		redirect_to post_images_path
		#@post_image = PostImage.find(params[:id])は、resourcesルーティングのdestroyで渡ってきたパラメータ（params[:id]）を元に、findメソッドを使って削除データを探し、@post_imageインスタンスに渡しています。@post_image.destroyでは、@post_imageインスタンスで渡されたデータを、destroyメソッドで削除しています。
	end
	private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
