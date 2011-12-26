class PageFilesController < ApplicationController
  # GET /page_files
  # GET /page_files.json
  def index
    @page_files = PageFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_files }
    end
  end

  # GET /page_files/1
  # GET /page_files/1.json
  def show
    @page_file = PageFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_file }
    end
  end

  # GET /page_files/new
  # GET /page_files/new.json
  def new
    @page_file = PageFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_file }
    end
  end

  # GET /page_files/1/edit
  def edit
    @page_file = PageFile.find(params[:id])
  end

  # POST /page_files
  # POST /page_files.json
  def create
    @page_file = PageFile.new(params[:page_file])

    respond_to do |format|
      if @page_file.save
        format.html { redirect_to @page_file, notice: 'Page file was successfully created.' }
        format.json { render json: @page_file, status: :created, location: @page_file }
      else
        format.html { render action: "new" }
        format.json { render json: @page_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_files/1
  # PUT /page_files/1.json
  def update
    @page_file = PageFile.find(params[:id])

    respond_to do |format|
      if @page_file.update_attributes(params[:page_file])
        format.html { redirect_to @page_file, notice: 'Page file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_files/1
  # DELETE /page_files/1.json
  def destroy
    @page_file = PageFile.find(params[:id])
    @page_file.destroy

    respond_to do |format|
      format.html { redirect_to page_files_url }
      format.json { head :ok }
    end
  end
end
