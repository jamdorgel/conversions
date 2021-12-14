class ConversionsController < ApplicationController
    def new
        @currency_codes = Conversion.currency_codes
        @conversion = Conversion.new
    end

    def create
        @conversion = Conversion.new
        @conversion.assign_attributes(conversion_params)
        @conversion.save
        if @conversion.rate_limited
            flash[:notice] = 'The conversion API has reached its rate limit, please try again in 20 mins'
            redirect_to root_path
        elsif @conversion.rate_limited == false
            redirect_to conversion_url(@conversion)
        end
    end

    def show
        @conversion = Conversion.find(params[:id])
    end

    private

    def conversion_params
        params.require(:conversion).permit(:starting_currency, :amount, :final_currency)
    end
end
