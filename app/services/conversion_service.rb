class ConversionService
    attr_reader :result, :starting_currency, :amount, :final_currency, :currency_codes

    def initialize(starting_currency = nil, amount = nil, final_currency = nil)
        @starting_currency = starting_currency
        @amount = amount
        @final_currency = final_currency
        # Add in rate limit detection & behaviour in this step
        if @starting_currency
            @result = HTTParty.get("https://open.er-api.com/v6/latest/#{@starting_currency}")
        else
            @result = HTTParty.get("https://open.er-api.com/v6/latest")
        end

        @currency_codes = @result['rates'].keys.sort
    end

    def conversion
        exchange_rate = @result['rates'][@final_currency]
        @amount * exchange_rate
    end
end
