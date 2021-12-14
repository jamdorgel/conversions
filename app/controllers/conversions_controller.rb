class ConversionsController < ApplicationController
    def new
        @currency_codes = Conversion.currency_codes
        @conversion = Conversion.new
    end

    def create
        @conversion = Conversion.new
        @conversion.assign_attributes(conversion_params)
        @conversion.save
    end

    private

    def conversion_params
        params.require(:conversion).permit(:starting_currency, :amount, :final_currency)
    end
end
