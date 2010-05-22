require 'gbarcode'

class Institution < ActiveRecord::Base

  SymbologyNames = ["EAN", "UPC", "ISBN", "Code 39", "Code 128", "Code 128-C", "Code 128-B", 
    "Interleaved 2 of 5", "Code 128 Raw", "Codabar", "MSI", "Plessy", "Code 93"]

  def barcode_format
    if checksum == false
      symbology | ::Gbarcode::BARCODE_NO_CHECKSUM
    else
      symbology
    end
  end
  
  def symbology_name
    SymbologyNames[symbology-1]
  end
  
  def symbology_name=(value)
    unless SymbologyNames.include?(value)
      raise ValueError, "Unknown symbology: #{value}"
    end
    symbology = SymbologyNames.index(value) + 1
  end
  
end