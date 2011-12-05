class SiteTextsController < ApplicationController
  # GET /site_texts
  # GET /site_texts.json
  def index
    @site_texts = SiteText.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_texts }
    end
  end

  # GET /site_texts/1
  # GET /site_texts/1.json
  def show
    @site_text = SiteText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_text }
    end
  end

  # GET /site_texts/new
  # GET /site_texts/new.json
  def new
    @site_text = SiteText.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_text }
    end
  end

  # GET /site_texts/1/edit
  def edit
    @site_text = SiteText.find(params[:id])
  end

  # POST /site_texts
  # POST /site_texts.json
  def create
    @site_text = SiteText.new(params[:site_text])

    respond_to do |format|
      if @site_text.save
        format.html { redirect_to @site_text, notice: 'Site text was successfully created.' }
        format.json { render json: @site_text, status: :created, location: @site_text }
      else
        format.html { render action: "new" }
        format.json { render json: @site_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_texts/1
  # PUT /site_texts/1.json
  def update
    @site_text = SiteText.find(params[:id])

    respond_to do |format|
      if @site_text.update_attributes(params[:site_text])
        format.html { redirect_to @site_text, notice: 'Site text was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_texts/1
  # DELETE /site_texts/1.json
  def destroy
    @site_text = SiteText.find(params[:id])
    @site_text.destroy

    respond_to do |format|
      format.html { redirect_to site_texts_url }
      format.json { head :ok }
    end
  end
end
