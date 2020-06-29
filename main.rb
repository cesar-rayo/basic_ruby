require './src/libs/reports.rb'

excel_report = Reports::ExcelReport.new("excel_report")
excel_report.build
# set report name to a new1 value
excel_report.report_name = "new_report"
excel_report.build

email_report = Reports::EmailReport.new("email_report")
email_report.build
#set object's attribute to a new value
email_report.sender = "another_mail@email.com"
email_report.build

csv_report = Reports::CsvReport.new("csv_report","author_1")
csv_report.build