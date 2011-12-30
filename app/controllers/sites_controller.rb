require 'dimensions'
require 'erb'
require 'fileutils'
require 'polyglot'
require 'treetop'
Treetop.load 'lib/webmarkup'


class SitesController < ApplicationController
private
  DEFAULT_TEMPLATE = %q{<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><%= page.texts.title %> | <%= site.texts.server %></title>

	<meta name="keywords" content=""> <!-- FIXME: TBD -->

	<link rel="stylesheet" href="stylesheets/layout.css" type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="stylesheets/style.css" type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="stylesheets/<%= raw_name(page.texts.filename) %>_layout.css" type="text/css" media="screen" charset="utf-8">
	<link rel="stylesheet" href="stylesheets/<%= raw_name(page.texts.filename) %>_style.css" type="text/css" media="screen" charset="utf-8">
</head>
<body>
	<div id="page">
		<div id="header">
			&nbsp; <!-- FIXME: TBD -->
		</div> <!-- end of header -->
		<div id="middle">
			<div id="sidebar">
				<div id="navigation">
				<% site.pages.each do |reference| %>
					<p><a href="<%= reference.texts.filename %>"><%= reference.texts.title %></a></p>
				<% end %>
				</div> <!-- end of navigation -->
			</div> <!-- end of sidebar -->
			<div id="main">
				<div id="main_content">
				<%= render(page.texts.content) unless page.texts.content.nil? %>
				</div> <!-- end of main_content -->
			</div> <!-- end of main area -->
		</div> <!-- end of middle -->
		<div id="footer_separator">
			&nbsp;
		</div> <!-- end of footer_separator -->
		<div id="footer">
			&nbsp; <!-- FIXME: TBD -->
		</div> <!-- end of the footer -->
	</div> <!-- end of page wrapper -->
</body>
</html>}
  
public
  # GET /sites
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /sites/1
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /sites/new
  def new
    @site = Site.new(:template => DEFAULT_TEMPLATE)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # GET /sites/1/generate
  def generate
    site = Site.find(params[:id])
    base_path = "#{Dir.pwd}/tmp/#{site.name}"
    FileUtils.rm_rf base_path if Dir.exists?(base_path)
    Dir.mkdir base_path
    
    notice = ''
    begin
      site.pages.each do |page|
        text = ERB.new(site.template).result(binding)
        File.open("#{base_path}/#{page.texts.filename}", 'w') {|file| file.write(text); file.flush}
        # logger.info text
      end
      notice = "pages for #{site.name} generated"
    rescue MissingError => e
      notice = "missing #{e.type}: #{e.name}"
    end
    
    respond_to do |format|
      format.html { redirect_to site, notice: notice }
    end
  end

  # POST /sites
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to sites_url, notice: 'Site was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /sites/1
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to sites_url, notice: 'Site was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /sites/1
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
    end
  end
  
private
  def render_page(content)
    parser = WebMarkupParser.new
    html = parser.parse(content)
    html.content
  end
  
  def image(file, alternative_text = '', properties='')
    # image_file = "images/#{file}"
    # path = get_path(image_file)
    image_file = "file://#{file}"
    path = file
    raise "image #{path} not found" unless File.file?(path)
    size = Dimensions.dimensions(path)
    image_properties = %Q{width="#{size[0]}px" height="#{size[1]}px"}
    image_properties += ' ' unless properties.blank?
    image_properties += properties unless properties.blank?
    return %Q{<img src="#{image_file}" alt="#{alternative_text}" #{image_properties}>}
  end

  def get_path(file)
    "page/#{file}"
  end
end
