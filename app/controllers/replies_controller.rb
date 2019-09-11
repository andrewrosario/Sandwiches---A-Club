class RepliesController < ApplicationController
    def create
        # "reply"=>{"user_id"=>"1", "comment_id"=>"5", "content"=>"help"}
        Reply.create(reply_params)
        sandwich = Comment.find(params[:reply][:comment_id]).sandwich
        redirect_to sandwich_path(sandwich)
    end

    private

    def reply_params
        params.require(:reply).permit(:user_id, :comment_id, :content)
    end
end
