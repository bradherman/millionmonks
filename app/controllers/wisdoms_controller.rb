class WisdomsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update, :destroy, :vote_up, :vote_down]
  def splash
  render :layout => false
  end
  # GET /wisdoms
  # GET /wisdoms.xml
  def index
    @wisdoms = Wisdom.paginate :page => params[:page], :order => "created_at DESC"
    @title = "millionmonks | Share Your Wisdom"
    authorize! :read, @wisdoms
    @wisdom = Wisdom.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wisdoms }
    end
  end
  
  def search
    if params[:search] == "best"
      @wisdoms = Wisdom.paginate :page => params[:page], :order => 'karma DESC'
    elsif params[:floor] and params[:ceiling]
      @wisdoms = Wisdom.where(:submitter_age => (params[:floor]..params[:ceiling]))
      @wisdoms = @wisdoms.paginate :page => params[:page], :order => "karma DESC"
    elsif params[:search] == "latest"
      @wisdoms = Wisdom.paginate :page => params[:page], :order => "created_at DESC"
    end
    
    render :update do |page| 
      page.replace_html "wisdoms", :partial => "wisdoms_list", :locals => {:wisdoms => @wisdoms}
    end
  end

  # GET /wisdoms/1
  # GET /wisdoms/1.xml
  def show
    @wisdom = Wisdom.find(params[:id])
    authorize! :read, @wisdom

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wisdom }
    end
  end

  # GET /wisdoms/new
  # GET /wisdoms/new.xml
  def new
    @wisdom = Wisdom.new
    authorize! :create, @wisdom
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wisdom }
    end
  end

  # GET /wisdoms/1/edit
  def edit
    @wisdom = Wisdom.find(params[:id])
    authorize! :update, @wisdom
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
    authorize! :destroy, @wisdom
    
    @wisdom.destroy

    respond_to do |format|
      format.html { redirect_to(wisdoms_url) }
      format.xml  { head :ok }
    end
  end
  
  def about
    @title = "MillionMonks | About"
  end
  
  def vote
    # authorize!
    if !current_user
      render :update do |page| 
        flash[:notice] = "Please login to vote"
        page.redirect_to login_path
      end
    else
      @wisdom = Wisdom.find(params[:id])
      current_user.vote(@wisdom, params[:vote])
      @wisdom.karma = @wisdom.votes_for - @wisdom.votes_against + 1
      @wisdom.save
      render :update do |page| 
        page.replace_html "votes_#{@wisdom.id}", :partial => "votes/wisdom_vote", :locals => {:wisdom => @wisdom}
      end
    end
  end
end
