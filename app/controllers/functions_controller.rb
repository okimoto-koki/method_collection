class FunctionsController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須
  before_action :set_function, only: [:show, :edit, :update, :destroy]

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
  	@function.emails = current_user.email
  	if @function.save
  		redirect_to :root
  	else 
  		render :new_function
  	end
  end

  def edit
  	@function = Function.find(params[:id])
  end

  def update
  	@function = Function.find(params[:id])
  	@function.emails = current_user.email
  	@function.update(function_params)
  	redirect_to :function
  end

  def destroy
  	@function.destroy
  	redirect_to :root
  end

  def search
  	# ransack
	@search = Function.search(params[:q])
  	@result = @search.result(distinct: true).page(params[:page])
  end

  private

  	def set_function
  		@function = Function.find(params[:id])
  	end

  	def function_params
  		params[:function].permit(:languages, :names, :data, :descriptions, :arguments, :return_values, :tags)
  	end
end
