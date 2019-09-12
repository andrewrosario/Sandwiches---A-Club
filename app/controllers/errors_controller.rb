class ErrorsController < ApplicationController
    def forbidden
        render status: 403
    end
    def not_found
        render status: 404
    end
end