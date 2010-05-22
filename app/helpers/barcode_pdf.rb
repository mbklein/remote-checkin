require 'prawn'
require 'prawn/layout'

class BarcodePdf < Prawn::Document
  
  def self.generate_pdf(barcodes, format = Gbarcode::BARCODE_39)
    pdf = self.new
    pdf.add_barcodes(barcodes, format)
    pdf.render
  end
  
  def initialize(*args)
    @rows = 6
    @cols = 2
    super(*args)
    @code_count = 0
    self.define_grid(:rows => @rows, :columns => @cols)
  end
  
  def add_barcode(string, format = Gbarcode::BARCODE_39)
    png = BarcodeGenerator.get_barcode_image(string, format)
    io = StringIO.new(png)
    if @code_count == (@rows * @cols)
      self.start_new_page
      @code_count = 0
    end
    row = @code_count / @cols
    col = @code_count % @cols
    self.image io, :scale => 0.75, :at => self.grid(row,col).top_left()
    io.close
    @code_count += 1
  end

  def add_barcodes(barcodes, format = Gbarcode::BARCODE_39)
    barcodes.each { |code| self.add_barcode(code, format) }
  end
  
end
