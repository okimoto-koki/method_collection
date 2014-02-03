class FunctionsController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須

  def index
  	@indexFunction = Function.all

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

  def search
	@search = Function.search(params[:q])
  	@result = @search.result(distinct: true)
  end

  def detail
  	@detail = Function.find_by id: params[:id]
  end
end
