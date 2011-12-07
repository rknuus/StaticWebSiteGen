class SitesController < ApplicationController
  # GET /sites
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
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
        format.html { redirect_to sites_url, notice: 'Site was successfully created.' }
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
        format.html { redirect_to sites_url, notice: 'Site was successfully updated.' }
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

  # GET /sites/1/require
  def require
    @site = Site.find(params[:id])
  end
  
  #GET /sites/1/new_site_text
  def new_site_text
    flash[:site_id] = params[:id]
    redirect_to new_site_text_path
  end
  
  #GET /sites/1/new_site_file
  def new_site_file
    flash[:site_id] = params[:id]
    redirect_to new_site_file_path
  end
end
