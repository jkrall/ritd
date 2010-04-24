class PuffinOrdersController < ApplicationController

  layout 'admin'

  def setup_includes
    super
    @stylesheets.push [ 'admin' ]  
    return true
  end  

  # GET /puffin_orders
  # GET /puffin_orders.xml
  def index
    @puffin_orders = PuffinOrder.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @puffin_orders }
    end
  end

  # GET /puffin_orders/1
  # GET /puffin_orders/1.xml
  def show
    @puffin_order = PuffinOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @puffin_order }
    end
  end

  # GET /puffin_orders/new
  # GET /puffin_orders/new.xml
  def new
    @puffin_order = PuffinOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @puffin_order }
    end
  end

  # GET /puffin_orders/1/edit
  def edit
    @puffin_order = PuffinOrder.find(params[:id])
  end

  # POST /puffin_orders
  # POST /puffin_orders.xml
  def create
    @puffin_order = PuffinOrder.new(params[:puffin_order])

    respond_to do |format|
      if @puffin_order.save
        flash[:notice] = 'PuffinOrder was successfully created.'
        format.html { redirect_to(@puffin_order) }
        format.xml  { render :xml => @puffin_order, :status => :created, :location => @puffin_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @puffin_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /puffin_orders/1
  # PUT /puffin_orders/1.xml
  def update
    @puffin_order = PuffinOrder.find(params[:id])

    respond_to do |format|
      if @puffin_order.update_attributes(params[:puffin_order])
        flash[:notice] = 'PuffinOrder was successfully updated.'
        format.html { redirect_to(@puffin_order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @puffin_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /puffin_orders/1
  # DELETE /puffin_orders/1.xml
  def destroy
    @puffin_order = PuffinOrder.find(params[:id])
    @puffin_order.destroy

    respond_to do |format|
      format.html { redirect_to(puffin_orders_url) }
      format.xml  { head :ok }
    end
  end
end
