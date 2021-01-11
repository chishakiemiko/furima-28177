class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end
  
  def new
     @furimas = Furima.new
  end
  
  def create
  end
end