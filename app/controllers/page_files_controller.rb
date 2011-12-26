class PageFilesController < ApplicationController
  # GET /page_files/1
  def show
    @page_file = PageFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /page_files/new
  def new
    @page_file = PageFile.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /page_files/1/edit
  def edit
    @page_file = PageFile.find(params[:id])
  end

  # POST /page_files
  def create
    @page_file = PageFile.new(params[:page_file])

    respond_to do |format|
      if @page_file.save
        format.html { redirect_to @page_file, notice: 'Page file was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /page_files/1
  def update
    @page_file = PageFile.find(params[:id])

    respond_to do |format|
      if @page_file.update_attributes(params[:page_file])
        format.html { redirect_to @page_file, notice: 'Page file was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /page_files/1
  def destroy
    @page_file = PageFile.find(params[:id])
    @page_file.destroy

    respond_to do |format|
      format.html { redirect_to page_files_url }
    end
  end
end
