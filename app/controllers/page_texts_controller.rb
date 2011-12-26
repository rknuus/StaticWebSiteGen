class PageTextsController < ApplicationController
  # GET /page_texts/1
  def show
    @page_text = PageText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /page_texts/new
  def new
    @page_text = PageText.new(:page_id => params[:page_id])

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
        format.html { redirect_to page_url(@page_text.page_id), notice: 'Page text was successfully created.' }
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
        format.html { redirect_to page_url(@page_text.page_id), notice: 'Page text was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /page_texts/1
  def destroy
    @page_text = PageText.find(params[:id])
    page_id = @page_text.page_id
    @page_text.destroy

    respond_to do |format|
      format.html { redirect_to page_url(page_id) }
    end
  end
end
