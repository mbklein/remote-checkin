class BarcodeMailer < ActionMailer::Base
  def barcodes(institution, codes)
    recipients  institution.email
    subject     "Summit items returned"
    from        "mbklein@gmail.com"
    
    attachment :content_type => 'application/pdf',
      :body => BarcodePdf.generate_pdf(codes, institution.barcode_format),
      :filename => "barcodes.pdf"
  end
end
