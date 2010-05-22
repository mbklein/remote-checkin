class BarcodeController < ApplicationController

  def display_form
    render :html => 'display_form'
  end
  
  def send_mail
    @institution = Institution.find(params[:institution_id])
    @barcodes = params[:barcodes].split(/[\s\n,]+/)
    BarcodeMailer.deliver_barcodes(@institution, @barcodes)
    render :html => 'send_mail'
  end

  def image
     string_to_encode = params[:string]
     institution = Institution.find(params[:institution_id])
     barcode_image = BarcodeGenerator.get_barcode_image(string_to_encode, institution.barcode_format)
     send_data(barcode_image, :type => 'image/png', :disposition => 'inline')
  end
  
end
