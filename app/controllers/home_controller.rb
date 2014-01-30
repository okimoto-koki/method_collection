class HomeController < ApplicationController
  before_filter :authenticate_user! #devise認証が必須

  def index
  end

  def new

  end

  def create
  	@newFunction = Function.new
  	@newFunction.names = params[:function][:names]
  	@newFunction.data = params[:function][:data]
  	@newFunction.descriptions = params[:function][:descriptions]
  	@newFunction.arguments = params[:function][:arguments]
  	@newFunction.return_values = params[:function][:return_values]
  	@newFunction.tags = params[:function][:tags]
  	@newFunction.save
  	redirect_to :root
  end
end
