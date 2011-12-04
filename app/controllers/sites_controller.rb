class SitesController < ApplicationController
  # GET /sites
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /sites/1
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /sites/new
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /sites/1
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /sites/1
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
    end
  end
end
