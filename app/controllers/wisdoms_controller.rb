class WisdomsController < ApplicationController
  # GET /wisdoms
  # GET /wisdoms.xml
  def index
    @title = "coming soon"
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
