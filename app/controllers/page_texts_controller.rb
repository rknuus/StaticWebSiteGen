class PageTextsController < ApplicationController
  # GET /page_texts
  def index
    @page_texts = PageText.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /page_texts/1
  def show
    @page_text = PageText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /page_texts/new
  def new
    @page_text = PageText.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /page_texts/1/edit
  def edit
    @page_text = PageText.find(params[:id])
  end

  # POST /page_texts
  def create
    @page_text = PageText.new(params[:page_text])

    respond_to do |format|
      if @page_text.save
        format.html { redirect_to @page_text, notice: 'Page text was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /page_texts/1
  def update
    @page_text = PageText.find(params[:id])

    respond_to do |format|
      if @page_text.update_attributes(params[:page_text])
        format.html { redirect_to @page_text, notice: 'Page text was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /page_texts/1
  def destroy
    @page_text = PageText.find(params[:id])
    @page_text.destroy

    respond_to do |format|
      format.html { redirect_to page_texts_url }
    end
  end
end
