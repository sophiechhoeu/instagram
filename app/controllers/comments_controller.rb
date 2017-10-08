class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @photo, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  def comment
    params.require(:comment).permit(:photo_id, :user_id, :content)
  end
end
