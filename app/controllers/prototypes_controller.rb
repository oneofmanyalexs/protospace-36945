class PrototypesController < ApplicationController
  #before_action :set_prototype, except: [:index, :new, :create]

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    @prototypes = Prototype.all
    @prototypes = Prototype.includes(:user)
  end


  def new 
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save!
      redirect_to prototypes_path(@prototypes)
    else
      @prototypes = Prototype.includes(:user)
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    #@comment = Comment.new
    #@comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
  end
  
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototypes_path(@prototype)
    else
      render :edit
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
