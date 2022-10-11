```ruby
class HomeController < ApplicationController
    def number
        @num1 = params[:num1].to_i ** 3
        @num2 = params[:num2].to_i ** 3
    end
    
    def evenly
        @num1 = params[:num1].to_i
        @num2 = params[:num2].to_i
        if @num1 % @num2 == 0
            @output = 'IT IS EVENLY'
        else 
            @output = 'IT IS ODDLY'
        end
    end

    def palindrome
        @str = params[:str]
        if @str.downcase.reverse == @str.downcase
             @output = 'is a Palindrome!'
        else
            @output = 'is NOT a Palindrome!'
        end
    end

    def madlib
        @noun = params[:noun]
        @verb = params[:verb]
        @adj = params[:adj]
        @adv = params[:adv]
    end

end
```