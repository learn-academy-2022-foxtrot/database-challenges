```ruby
class BankController < ApplicationController>

    def bank_landing
        @team = ['Guan', 'Joseph']
    end

    def sign_in
    end

    def guans_best
        @title = "This is Guan's favorite interests: #{@best}."
        @best = ['pottery', 'software engineer', 'motorcycles']
    end

    def josephs_best
        @title = "This is Joseph's hobbies: #{@best}."
        @best = ['web developer', 'trucks', 'gamer']
    end

end
```