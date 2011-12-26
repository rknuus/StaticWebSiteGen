class PagesController < ApplicationController
  # GET /pages
  def index
    set_site_id
    site = Site.find(@site_id)
    @site_name = ''
    @site_name = site.name unless site.nil?
    @pages = Page.find_all_by_site_id(@site_id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /pages/1
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pages/new
  def new
    set_site_id
    @page = Page.new(:site_id => @site_id)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path(:site_id => @page.site_id), notice: 'Page was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /pages/1
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
    end
  end
  
private
  def set_site_id
    @site_id = -1
    @site_id = params[:site_id].to_i if params[:site_id]
  end
end
