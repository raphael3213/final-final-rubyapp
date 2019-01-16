
require 'csv'
class Inventory < ActiveRecord::Base

	
	before_save :find_volume

	REGEX1=	/[A-Z]{3}[0-9]{4}/i
	REGEX2=/[0-9]{15}/

	validates :item_type, presence:true ,length:{minimum:3}
	validates :sku		 	 , presence:true ,length:{minimum:7},format:{with:REGEX1},uniqueness:{case_sensitive:false}
	validates :Title    , presence:true ,length:{minimum:3}
	validates :serial_number,presence:true,length:{is:15},format:{with:REGEX2},uniqueness:{case_sensitive:false}
	validates :quantity, presence:true, numericality: { only_integer: true }
	validates :price, presence:true, numericality: { only_integer: true }
	validates :Length, presence:true, numericality: { only_integer: true }
	validates :Breadth, presence:true, numericality: { only_integer: true }
	validates :Height, presence:true, numericality: { only_integer: true }
	validates :Weight, presence:true, numericality: { only_integer: true}
	validates :organization, presence:true ,length:{minimum:3}
	validates :description, presence:true ,length:{minimum:5}
	validates :short_description, presence:true ,length:{minimum:3}
	validates :asset_code,presence:true,length:{minimum:4}
	validates :grade,presence:true,length:{minimum:4}
	validates :category,presence:true,length:{minimum:4}
	validates :brand,presence:true,length:{minimum:4}


	 def self.open_spreadsheet(file)
   case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"           
    end
end


	def self.import(file)

		@errors=[]
  spreadsheet = self.open_spreadsheet(file)
  header = spreadsheet.row(1)

  (2..spreadsheet.last_row).each do |i|
  	@hasher={}
  	@hasher["row"]=i

    row = Hash[[header, spreadsheet.row(i)].transpose]
    inventory = find_by_id(row["id"]) || new
    inventory.attributes = row.to_hash.slice(*column_names)
    	
    	if(inventory.valid?)
   			 inventory.save!
  		else
  	 		@hasher["errors"]=inventory.errors.full_messages
  	 		@errors.push(@hasher)
  		end

  end

 return @errors
end






	private

	def find_volume
		self.Volume= self.Length*self.Breadth*self.Height
	end

end