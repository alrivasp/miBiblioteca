class HomeController < ApplicationController
    def index
        @books = Book.PRESTADO.page(params[:page])
    end
    
end