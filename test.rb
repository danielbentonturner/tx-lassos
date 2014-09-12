require 'spreadsheet'

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet.open 'export.xls'

worksheet = book.worksheet 0

worksheet.each do |row|
  if row[0].nil?

  end
end
