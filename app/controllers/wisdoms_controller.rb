class WisdomsController < ApplicationController
  # GET /wisdoms
  # GET /wisdoms.xml
  def index
    @wisdoms = Wisdom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wisdoms }
    end
  end

  # GET /wisdoms/1
  # GET /wisdoms/1.xml
  def show
    @wisdom = Wisdom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wisdom }
    end
  end

  # GET /wisdoms/new
  # GET /wisdoms/new.xml
  def new
    @wisdom = Wisdom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wisdom }
    end
  end

  # GET /wisdoms/1/edit
  def edit
    @wisdom = Wisdom.find(params[:id])
  end

  # POST /wisdoms
  # POST /wisdoms.xml
  def create
    @wisdom = Wisdom.new(params[:wisdom])

    respond_to do |format|
      if @wisdom.save
        format.html { redirect_to(@wisdom, :notice => 'Wisdom was successfully created.') }
        format.xml  { render :xml => @wisdom, :status => :created, :location => @wisdom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wisdom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wisdoms/1
  # PUT /wisdoms/1.xml
  def update
    @wisdom = Wisdom.find(params[:id])

    respond_to do |format|
      if @wisdom.update_attributes(params[:wisdom])
        format.html { redirect_to(@wisdom, :notice => 'Wisdom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wisdom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wisdoms/1
  # DELETE /wisdoms/1.xml
  def destroy
    @wisdom = Wisdom.find(params[:id])
    @wisdom.destroy

    respond_to do |format|
      format.html { redirect_to(wisdoms_url) }
      format.xml  { head :ok }
    end
  end
end
