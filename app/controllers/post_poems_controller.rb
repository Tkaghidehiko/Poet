class PostPoemsController < ApplicationController


    def index
    	@poems = PostPoem.all.order(created_at: :desc)
    end
 	def new
 		@poem = PostPoem.new
    end

    def create
    	@poem = PostPoem.new(post_poem_params)
    	@poem.user_id = @current_user.id
    	if @poem.save
    		redirect_to new_post_trans_path, notice: アーティスト作成に成功しました。
    	else
    		redirect_to new_post_poem_path, notice: アーティストの作成に失敗しました。
    	end

    end


    def show
    	@poem = PostPoem.find(params[:id])
    end

    def edit
    	@poem = PostPoem.find(params[:id])
    end

    def update
    	@poem = PostPoem.find(params[:id])
    	@poem.user_id = @current_user.id
    	if @poem.update(post_poem_params)
    		redirect_to post_poem_path(@post_poem.id), notice: 'アーティスト名が編集されました。'
    	else
    		render :index, notice: 'アーティストの削除に失敗。'
    	end
    end

    def destroy
    	poem = PostPoem.find(params[:id])
    	if poem.delete
    	redirect_to post_poems_path, notice: 'アーティストは削除されました。'
    	else
    		render :index, notice: 'アーティストの削除に失敗。'
    	end
    end

    private
    def post_poem_params
    	params.require(:postpoem).permit(:postpoem_name)
    end
end
