require 'net/http'
require 'uri'

class ProgressWebsController < ApplicationController
layout "application"
 include ActionController::Live
  
  before_action :set_progress_web, only: [:edit, :update, :destroy]
  @@thread
  @@test=0
  @@clonePW

  # GET /progress_webs
  # GET /progress_webs.json
  def index
    @progress_web=ProgressWeb.new
  end

 def progress
 end

  # GET /progress_webs/1
  # GET /progress_webs/1.json
  def show
    puts "Downloading %s" % @@clonePW['url'].to_s
    @@thread = download(@@clonePW['url'].to_s)
    @progress_web=@@clonePW
  end

  # GET /progress_webs/new
  def new
   # stream
    @@test= "%.2f" % @@thread[:progress].to_f 
    render :partial => "progress", :locals => { :progress_int => @@test }
    puts "getting"

   
  end

  def download(url)
    Thread.new do
      thread = Thread.current
      body = thread[:body] = []
      url = URI.parse url
      Net::HTTP.new(url.host, url.port).request_get(url.path) do |response|
        length = thread[:length] = response['Content-Length'].to_i
         
        response.read_body do |fragment|
          body << fragment
          thread[:done] = (thread[:done] || 0) + fragment.length
          thread[:progress] = thread[:done].quo(length) * 100
        end
      end
    end
end


  # GET /progress_webs/1/edit
  def edit
  end

  # POST /progress_webs
  # POST /progress_webs.json
  def create
    @progress_web = ProgressWeb.new(progress_web_params)
    @@clonePW=@progress_web
    respond_to do |format|
      if @progress_web.save
        format.html { redirect_to @progress_web, notice: 'Progress web was successfully created.' }
      #  format.json { render action: 'show', status: :created, location: @progress_web }
      else
        format.html { render action: 'new' }
        format.json { render json: @progress_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_webs/1
  # PATCH/PUT /progress_webs/1.json
  def update
    respond_to do |format|
      if @progress_web.update(progress_web_params)
        format.html { redirect_to @progress_web, notice: 'Progress web was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @progress_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_webs/1
  # DELETE /progress_webs/1.json
  def destroy
    @progress_web.destroy
    respond_to do |format|
      format.html { redirect_to progress_webs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress_web

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_web_params
      params.require(:progress_web).permit(:url)
    end
end
