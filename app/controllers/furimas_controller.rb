class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end
end

  def new
     @furimas = Furima.new
  end
  
end