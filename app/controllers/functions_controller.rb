class FunctionsController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須

  def index
  	@indexFunction = Function.order("updated_at DESC").page(params[:page]).per(10)

  end

  def new
  	@newFunction = Function.new
  end

  def show
  	@showFunction = Function.find(params[:id])
  end

  def create
  	@createFunction = Function.new(function_params)
  	@createFunction.save
  	redirect_to :root
  end

  def edit
  	
  end

  def search
	@search = Function.search(params[:q])
  	@result = @search.result(distinct: true).page(params[:page])
  end

  private

  	def function_params
  		params[:function].permit(:languages, :names, :data, :descriptions, :arguments, :return_values, :tags)
  	end
end
