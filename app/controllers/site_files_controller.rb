class SiteFilesController < ApplicationController
  # GET /site_files
  # GET /site_files.json
  def index
    @site_files = SiteFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_files }
    end
  end

  # GET /site_files/1
  # GET /site_files/1.json
  def show
    @site_file = SiteFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_file }
    end
  end

  # GET /site_files/new
  # GET /site_files/new.json
  def new
    @site_file = SiteFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_file }
    end
  end

  # GET /site_files/1/edit
  def edit
    @site_file = SiteFile.find(params[:id])
  end

  # POST /site_files
  # POST /site_files.json
  def create
    @site_file = SiteFile.new(params[:site_file])

    respond_to do |format|
      if @site_file.save
        format.html { redirect_to @site_file, notice: 'Site file was successfully created.' }
        format.json { render json: @site_file, status: :created, location: @site_file }
      else
        format.html { render action: "new" }
        format.json { render json: @site_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_files/1
  # PUT /site_files/1.json
  def update
    @site_file = SiteFile.find(params[:id])

    respond_to do |format|
      if @site_file.update_attributes(params[:site_file])
        format.html { redirect_to @site_file, notice: 'Site file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_files/1
  # DELETE /site_files/1.json
  def destroy
    @site_file = SiteFile.find(params[:id])
    @site_file.destroy

    respond_to do |format|
      format.html { redirect_to site_files_url }
      format.json { head :ok }
    end
  end
end
