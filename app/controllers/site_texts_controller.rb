class SiteTextsController < ApplicationController
  # GET /site_texts
  def index
    @site_texts = SiteText.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /site_texts/new
  def new
    @site_text = SiteText.new

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
        format.html { redirect_to @site_text, notice: 'Site text was successfully created.' }
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
        format.html { redirect_to @site_text, notice: 'Site text was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /site_texts/1
  def destroy
    @site_text = SiteText.find(params[:id])
    @site_text.destroy

    respond_to do |format|
      format.html { redirect_to site_texts_url }
    end
  end
end
