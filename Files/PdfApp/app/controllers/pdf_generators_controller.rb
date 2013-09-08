require "pdfkit"
require "open-uri"
require 'shrimp'
require 'prawn'


class PdfGeneratorsController < ApplicationController
  before_action :set_pdf_generator, only: [:show, :edit, :update, :destroy]

  # GET /pdf_generators
  # GET /pdf_generators.json
  def index
    @pdf_generators = PdfGenerator.all
  end

  # GET /pdf_generators/1
  # GET /pdf_generators/1.json
  def show
  end

  # GET /pdf_generators/new
  def new
    @pdf_generator = PdfGenerator.new
  end

  # GET /pdf_generators/1/edit
  def edit
  end

  # POST /pdf_generators
  # POST /pdf_generators.json
  def create
    @pdf_generator = PdfGenerator.new(pdf_generator_params)
#    kit = PDFKit.new(@pdf_generator.url)
   if @pdf_generator.url.length>5
      options = { :margin => "1cm"}
      Shrimp::Phantom.new(@pdf_generator.url, options).to_pdf("output.pdf")
    else

    end
    send_file 'output.pdf'

  end

  # PATCH/PUT /pdf_generators/1
  # PATCH/PUT /pdf_generators/1.json
  def update
    respond_to do |format|
      if @pdf_generator.update(pdf_generator_params)
        format.html { redirect_to @pdf_generator, notice: 'Pdf generator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pdf_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_generators/1
  # DELETE /pdf_generators/1.json
  def destroy
    @pdf_generator.destroy
    respond_to do |format|
      format.html { redirect_to pdf_generators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_generator
      @pdf_generator = PdfGenerator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_generator_params
      params.require(:pdf_generator).permit(:url, :filepath, :fd1, :fd2, :upload)
    end
end
