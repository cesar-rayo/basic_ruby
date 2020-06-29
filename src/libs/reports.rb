#use module to group classes
module Reports
    class ExcelReport
        def initialize(report_name)
            @report_name = report_name
        end

        #define getter
        def report_name
            @report_name #does not need 'return'
        end

        #define setter
        def report_name=(new_name)
            @report_name = new_name
        end

        def build
            puts "=> Execute build '#{@report_name}'"
        end
    end

    #Using attr_accessor to define attributes using symbols
    class EmailReport
        attr_accessor :report_name, :sender
        def initialize(report_name)
            @report_name = report_name
            @sender = "ai_noresponse@email.com"
        end
        def build
            puts "=> Sender '#{@sender}' report '#{@report_name}'"
        end
    end

    #Using Struct class to define attributes
    class CsvReport < Struct.new(:file_name, :author)
        def initialize(file_name, author)
            @file_name = file_name
            @author = author
        end
        def build
            puts "=> Created file '#{@file_name}' by '#{@author}'"
        end
    end
end