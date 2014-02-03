class FunctionsController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須

  def index
  	@indexFunction = Function.order("updated_at DESC").page(params[:page]).per(10)

  end

  def new

  end

  def create
  	@newFunction = Function.new
  	@newFunction.languages = params[:languages]
  	@newFunction.names = params[:names]
  	@newFunction.data = params[:data]
  	@newFunction.descriptions = params[:descriptions]
  	@newFunction.arguments = params[:arguments]
  	@newFunction.return_values = params[:return_values]
  	@newFunction.tags = params[:tags]
  	@newFunction.save
  	redirect_to :root
  end

  def edit
  	
  end

  def search
	@search = Function.search(params[:q])
  	@result = @search.result(distinct: true).page(params[:page])
  end

  def detail
  	@detail = Function.find_by id: params[:id]
  end
end
