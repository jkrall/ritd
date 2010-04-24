class PageController < ApplicationController

  def index
    @stylesheets = @stylesheets - ['plain']
    @stylesheets.push 'index'
  end

  def products
  end

  def services
  end

  def about
  end

  def resources
  end

  def puffins
  end

  def whiffles
  end

  def cookies
  end

end
