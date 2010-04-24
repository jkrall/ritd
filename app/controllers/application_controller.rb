class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'page'

  helper :all # include all helpers, all the time

  # Set up before_filter to initialize the empty stylesheets array
  # * @stylesheets global will hold a list of stylesheets that will be included by the layouts
  # * Items can be appended to this in the actions of each controller, allowing us to include custom stylesheets on a per-action (per-page) basis
  before_filter :setup_includes
  def setup_includes
    @stylesheets = [ 'standard', 'plain' ]
    @javascripts = [ 'dropdown' ] # [ 'standard.js' ]  # We get the default js from google now
    return true
  end

  # before_filter for checking if the "internal_traffic" cookie is set
  before_filter :check_local_traffic
  def check_local_traffic
    if not cookies.nil?
      $local_traffic = (cookies[:ritd_internal_traffic] == "1")
    end
    return true
  end

  # before_filter for creating default meta tags
  before_filter :meta_defaults
  def meta_defaults
    @meta_content = {}
    @meta_content["title"] = "Rollin' In The Dough Fundraising | RITDFundraising.com"
    @meta_content["keywords"] = "fundraising pastries cookies puffin sales"
    @meta_content["description"] = ""
    @meta_content["robots"] = "index,follow"
    @meta_content["revisit-after"] = "2 days"
    @meta_content["copyright"] = "&copy; Copyright 2008, Rollin' In The Dough Fundraising"
    @meta_content["publisher"] = "Rollin' In The Dough Fundraising"
    @meta_content["distribution"] = "Global"
    @meta_httpequiv = {}
    @meta_httpequiv["Content-Type"] = "text/html charset=iso-8859-1"
    @meta_httpequiv["Content-Style-Type"] = "text/css"
  end

end
