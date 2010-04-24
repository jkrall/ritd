class FundraisersController < ApplicationController

  layout 'admin'

  def setup_includes
    super
    @stylesheets.push [ 'admin' ]  
    return true
  end  

  
  # GET /fundraisers
  # GET /fundraisers.xml
  def index
    @fundraisers = Fundraiser.find(:all)
    @active_fundraisers = Fundraiser.active
    @old_fundraisers = Fundraiser.old

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fundraisers }
    end
  end

  # GET /fundraisers/1
  # GET /fundraisers/1.xml
  def show
    @fundraiser = Fundraiser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fundraiser }
    end
  end

  # GET /fundraisers/new
  # GET /fundraisers/new.xml
  def new
    @fundraiser = Fundraiser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fundraiser }
    end
  end

  # GET /fundraisers/1/edit
  def edit
    @fundraiser = Fundraiser.find(params[:id])
  end

  # POST /fundraisers
  # POST /fundraisers.xml
  def create
    @fundraiser = Fundraiser.new(params[:fundraiser])

    respond_to do |format|
      if @fundraiser.save
        flash[:notice] = 'Fundraiser was successfully created.'
        format.html { redirect_to(@fundraiser) }
        format.xml  { render :xml => @fundraiser, :status => :created, :location => @fundraiser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fundraiser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fundraisers/1
  # PUT /fundraisers/1.xml
  def update
    @fundraiser = Fundraiser.find(params[:id])

    respond_to do |format|
      if @fundraiser.update_attributes(params[:fundraiser])
        flash[:notice] = 'Fundraiser was successfully updated.'
        format.html { redirect_to(@fundraiser) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fundraiser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fundraisers/1
  # DELETE /fundraisers/1.xml
  def destroy
    @fundraiser = Fundraiser.find(params[:id])
    @fundraiser.destroy

    respond_to do |format|
      format.html { redirect_to(fundraisers_url) }
      format.xml  { head :ok }
    end
  end
end
