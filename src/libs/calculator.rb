module Calculators
    class BasicCalculator
        def addition(num1, num2)
            num1 + num2
        end
        def multiplication(num1, num2)
            num1 * num2
        end
    end
    class MagicNumbers
        def print_odds(range)
            range.each{|num| if num.odd?
                puts num
            end
            }
        end
        def print_evens(range)
            for num in range do
                if num.even?
                    puts num
                end
            end
        end
        def find_odds(range)
            arr_odds = range.select{|num| num.odd?}
            puts "=> #{self.class}: find_odds: #{arr_odds}"
        end
        def count_odds(range)
            puts "=> #{self.class}: count_odds: #{range.count{|num| num.odd?}}"
        end
        def find_evens(range)
            arr_evens = range.select{|num| num.even?}
            puts "=> #{self.class}: find_evens: #{arr_evens}"
        end
        def potentiate(range, times)
            puts "=> #{self.class}: potentiate: #{range.map{|num| num*times}}"
        end
    end
end