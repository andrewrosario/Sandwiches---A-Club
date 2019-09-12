class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        redirect_to sandwich_path(params[:sandwich_id])
    end

    def destroy
        comment = Comment.find(params[:comment_id])
        if !comment.replies.empty?
            comment.content = 'This comment has been deleted.'
            comment.save
        else
            comment.destroy
        end
        redirect_to sandwich_path(params[:sandwich_id])
    end

    private

    def comment_params
        params.permit(:title, :rating, :user_id, :sandwich_id, :content)
    end
end
