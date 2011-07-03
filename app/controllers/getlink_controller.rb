require 'nokogiri'
require 'open-uri'



class GetlinkController < ApplicationController
  def index

  end

  def get_link
    begin
      html = Nokogiri::HTML(open("#{params[:link]}"))
      name = html.search("a.bigChar")
      @name = name
      @doc = []
      html.search('table.listing a').each do |link|
        @doc << link[:href] if link.content == "Download"
      end
      @text = params[:link]
    rescue Errno::ENOENT 
      respond_to do |format|
        format.js   { render 'error'}
        format.xml  { render :xml => @mah_blogz }
      end
    else
      respond_to do |format|
        format.js
        format.xml  { render :xml => @mah_blogz }
      end
    end

  end

end
