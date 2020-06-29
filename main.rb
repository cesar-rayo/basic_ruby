require './src/libs/reports.rb'
require './src/libs/calculator.rb'

excel_report = Reports::ExcelReport.new("excel_report")
excel_report.build
# set report name to a new1 value
excel_report.report_name = "new_report"
excel_report.build

#print object's class
#puts(excel_report.class)

#print object's methods
#puts(excel_report.methods)

email_report = Reports::EmailReport.new("email_report")
email_report.build
#set object's attribute to a new value
email_report.sender = "another_mail@email.com"
email_report.build

csv_report = Reports::CsvReport.new("csv_report","author_1")
csv_report.build
csv_report.file_name = "new_csv_report"
csv_report.build

example = Reports::Example.new
example.printHash

calc = Calculators::MagicNumbers.new
numbers = 1..10

calc.find_odds(numbers)
calc.count_odds(numbers)
calc.find_evens(numbers)
calc.potentiate(numbers,4)