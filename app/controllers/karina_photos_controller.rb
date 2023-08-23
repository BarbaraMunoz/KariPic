class KarinaPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_karina, only: [:new, :create, :edit, :update, :destroy]

  def index
    @karina_photos = KarinaPhoto.all
  end

  def show
    @karina_photo = KarinaPhoto.find(params[:id])
    @comment = Comment.new
  end

  def new
    @karina_photo = KarinaPhoto.new
  end

  def create
    @karina_photo = current_user.karina_photos.build(karina_photo_params)

    if @karina_photo.save
      redirect_to root_path, notice: 'Publicación creada con éxito'
    else
      render :new
    end
  end

  def edit
    @karina_photo = current_user.karina_photos.find(params[:id])
  end

  def update
    @karina_photo = current_user.karina_photos.find(params[:id])

    if @karina_photo.update(karina_photo_params)
      redirect_to root_path, notice: 'Publicación actualizada con éxito'
    else
      render :edit
    end
  end

  def destroy
    @karina_photo = current_user.karina_photos.find(params[:id])
    @karina_photo.destroy

    redirect_to root_path, notice: 'Publicación eliminada con éxito'
  end

  private

  def karina_photo_params
    params.require(:karina_photo).permit(:title, :description, :image)
  end

  def check_karina
    unless current_user.admin?
      redirect_to root_path, alert: 'No está autorizado para esta acción'
    end
  end
end
