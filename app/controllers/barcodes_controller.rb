class BarcodesController < ApplicationController
  before_filter :cancel?, :only => [ :send_mail ]

  def cancel?
    if params[:commit] == 'Cancel'
      redirect_to '/barcode'
    end
  end

  def display_form
  end
  
  def send_mail
    @confirmed = params[:commit] == 'Confirm'
    @institution = Institution.find(params[:institution_id])
    @barcodes = params[:barcodes].split(/[\s\n,;:]+/)
    if @confirmed
      BarcodeMailer.deliver_barcodes(@institution, @barcodes)
    end
  end

  def image
     string_to_encode = params[:string]
     institution = Institution.find(params[:institution_id])
     barcode_image = BarcodeGenerator.get_barcode_image(string_to_encode, institution.barcode_format)
     send_data(barcode_image, :type => 'image/png', :disposition => 'inline')
  end
  
end
