class FunctionsController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須
  before_action :set_function, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit, :update]

  def index
  	@function = Function.order("updated_at DESC").page(params[:page]).per(10)

  end

  def new
  	@function = Function.new
  end

  def show
  end

  def create
  	@function = Function.new(function_params)
  	if @function.save
  		redirect_to :root
  	else 
  		render new_function_path
  	end
  end

  def edit
  	@function = Function.find(params[:id])
  end

  def update
  	@function = Function.find(params[:id])
  	@function.update(function_params)
  	redirect_to function_path
  end

  def destroy
  	@function.destroy
  	redirect_to root_path
  end

  def search
	@search = Function.search(params[:q])
  	@result = @search.result(distinct: true).page(params[:page])
  end

  private

  	def set_function
  		@function = Function.find(params[:id])
  	end

  	def set_user
  		@user = User.find(params[:current_user.id])
  	end

  	def function_params
  		params[:function].permit(:languages, :names, :data, :descriptions, :arguments, :return_values, :tags)
  	end
end
