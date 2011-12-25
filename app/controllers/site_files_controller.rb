class SiteFilesController < ApplicationController
  # GET /site_files/1
  def show
    @site_file = SiteFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /site_files/new
  def new
    @site_file = SiteFile.new(:site_id => params[:site_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /site_files/1/edit
  def edit
    @site_file = SiteFile.find(params[:id])
  end

  # POST /site_files
  def create
    @site_file = SiteFile.new(params[:site_file])

    respond_to do |format|
      if @site_file.save
        format.html { redirect_to site_url(@site_file.site_id), notice: 'Site file was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /site_files/1
  def update
    @site_file = SiteFile.find(params[:id])

    respond_to do |format|
      if @site_file.update_attributes(params[:site_file])
        format.html { redirect_to site_url(@site_file.site_id), notice: 'Site file was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /site_files/1
  def destroy
    @site_file = SiteFile.find(params[:id])
    site_id = @site_file.site_id
    @site_file.destroy

    respond_to do |format|
      format.html { redirect_to site_url(site_id) }
    end
  end
end
