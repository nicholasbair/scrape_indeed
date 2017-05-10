class ScrapeIndeed::Excel
  def self.write(data)
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(:name => "Jobs") do |sheet|
      styles = wb.styles.add_style :b => true,
        :border => { :style => :thin, :color => "000000", :edges => [:bottom] }
      sheet.add_row ["Company", "Job Title", "Location", "Description"], :style => styles

      data.each do |job|
        sheet.add_row [job[:name], job[:title], job[:location], job[:description]]
      end
    end
    p.serialize self.config_filename
  end

  def self.config_filename
    "#{Dir.home()}/Desktop/scraped-indeed-#{Date.today.to_s}.xlsx"
  end
end
