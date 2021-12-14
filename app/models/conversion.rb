class Conversion < ApplicationRecord
    after_create :set_converted_amount
    def set_converted_amount
        result = HTTParty.get("https://open.er-api.com/v6/latest/#{self.starting_currency}")

        if result['result'] != 'success'
            self.rate_limited = true
            self.save
            return
        end

        exchange_rate = result['rates'][self.final_currency]
        self.converted_amount = (self.amount * exchange_rate).round(2)
        self.save
    end

    def self.currency_codes
        result = HTTParty.get("https://open.er-api.com/v6/latest")
        result['rates'].keys.sort
    end
end
