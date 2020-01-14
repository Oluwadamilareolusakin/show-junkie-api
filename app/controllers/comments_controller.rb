class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]

  def index
    @comments = Comment.where(show: (params[:show]).to_i)
    json_response(@comments)
  end

  def create
    @comment = Comment.create!(comment_params)
    json_response(@comment, :created)
  end
  
  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comments = Comment.where(show: (params[:show]).to_i)
      @comment = @comments.find_by(id: params[:id])
    end

    def comment_params
      params.permit(:content, :show, :user_id)
    end
end
