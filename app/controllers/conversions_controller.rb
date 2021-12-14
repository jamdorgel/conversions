class ConversionsController < ApplicationController
    def new
        @currency_codes = Conversion.currency_codes
    end
end
