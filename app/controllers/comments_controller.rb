class CommentsController < ApplicationController
  before_action :set_photo

  def index
    @comment = Comment.all
  end

  def show
    @comment.user = current_user
  end


  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to root_path
    # respond_to do |format|
    #
    #     format.html { redirect_to root_path, notice: 'comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

    def destroy
      @comment = @photo.comments.find(params[:id])
      @comment.destroy
      redirect_to root_path
    end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end



  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
