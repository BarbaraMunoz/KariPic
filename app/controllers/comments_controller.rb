class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @karina_photo = KarinaPhoto.find(params[:karina_photo_id])
    @comment = @karina_photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @karina_photo, notice: 'Comentario creado con éxito'
    else
      redirect_to @karina_photo, alert: 'El comentario no fue creado'
    end
  end

  def edit
    @karina_photo = KarinaPhoto.find(params[:karina_photo_id])
    @comment = @karina_photo.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @karina_photo = @comment.karina_photo

    if @comment.update(comment_params)
      redirect_to @karina_photo, notice: 'Comentario actualizado con éxito'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @karina_photo = @comment.karina_photo
  
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to @karina_photo, notice: 'Comentario eliminado con éxito'
    else
      redirect_to @karina_photo, alert: 'No tienes permiso para eliminar este comentario'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end


