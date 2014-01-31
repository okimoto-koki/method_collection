class HomeController < ApplicationController
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
  end

  def search_result
  	@search_result = Function.find_all_by_languages(params[:languages])
  end
end
