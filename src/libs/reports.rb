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
            puts "=> #{self.class}: Execute build '#{@report_name}'"
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
            puts "=> #{self.class}: Sender '#{@sender}' report '#{@report_name}'"
        end
    end

    #Using Struct class to define attributes
    class CsvReport < Struct.new(:file_name, :author)
        def initialize(file_name, author)
            @file_name = file_name
            @author = author
        end
        def build
            #using %Q instead double quotes
            puts %Q(=> #{self.class}: Created file '#{@file_name}' by '#{@author}')
        end
    end

    class Example
        attr_accessor :test_hash
        def initialize
            @test_hash = {
                "key_1" => "val_1",
                "key_2" => "val_2",
                "key_3" => "val_3"
            }
        end
        def printHash
            @test_hash.each do |key, value|
                puts "=> #{self.class}: printHash: #{key}, #{value}"
            end
        end
    end
end