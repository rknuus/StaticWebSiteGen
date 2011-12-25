class SiteTextsController < ApplicationController
  # GET /site_texts/1
  def show
    @site_text = SiteText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /site_texts/new
  def new
    @site_text = SiteText.new(:site_id => params[:site_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /site_texts/1/edit
  def edit
    @site_text = SiteText.find(params[:id])
  end

  # POST /site_texts
  def create
    @site_text = SiteText.new(params[:site_text])

    respond_to do |format|
      if @site_text.save
        format.html { redirect_to site_url(@site_text.site_id), notice: 'Site text was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /site_texts/1
  def update
    @site_text = SiteText.find(params[:id])

    respond_to do |format|
      if @site_text.update_attributes(params[:site_text])
        format.html { redirect_to site_url(@site_text.site_id), notice: 'Sitet text was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /site_texts/1
  def destroy
    @site_text = SiteText.find(params[:id])
    site_id = @site_text.site_id
    @site_text.destroy

    respond_to do |format|
      format.html { redirect_to site_url(site_id) }
    end
  end
end
