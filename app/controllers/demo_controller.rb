class DemoController < ApplicationController
  layout "application"


  def index
  	#render(:template => 'demo/hello')
  	@ar = 1..10
  	@id = params[:id]
  end

  def hello
  	#render("index")
  	@id = params[:id]
  end

  def yet_another_hello
  	#redirect_to(:action => 'index')
  end

  def google
  	#redirect_to("https://www.google.com")
  end

  def text_helpers
  end

  def escape_output
  end

end
