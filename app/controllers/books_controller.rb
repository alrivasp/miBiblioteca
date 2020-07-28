class BooksController < ApplicationController
    #Callback 
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    #Vista Principal de  controlador
    def index
        #@books = Book.all
        #@books = Book.all.page(params[:page])
        @book =  
        @q = Book.ransack(params[:q])
        #@books = @q.result(distinc: true)
        #@books = q.result(distinc: true).page(params[:page])
        @books = @q.result.page(params[:page])
    end
    
    #Vista de entrada Ingreso de Libro
    def new
        @book = Book.new
    end
    
    #Vista de Salida de Ingreso de libro
    def create
        @book = Book.new(book_params)
        @book.title = @book.title.titleize
        @book.author = @book.author.titleize
        if @book.save
            redirect_to books_path, notice: 'Libro fue creado Correctamente.-'
        else
            flash.now[:alert] = 'Libro NO pudo ser Creado'
            render :new
        end
    end
    
    #Vista de Edicion no utilizada
    def edit
    end
    
    #Vista de Actualizacion de Libro
    def update
        if @book.update(book_params)
            redirect_to books_path, notice: 'Libro se Actualizo Correctamente.-'
        else
            flash.now[:alert] = 'Libro NO se Pudo Actualizar'
            render :edit
        end
    end
    
    #Vista de Eliminacion de Libro
    def destroy
        @book.destroy
        redirect_to books_url, notice: 'Libro fue Eliminado Correctamente.-'
    end
    
    #Metodos Pivados importantes para las demas vistas
    private
        #Metodo que busca registro para poder mostrar esto va en conjunto con el call back del comienzo
        def set_book
            @book = Book.find(params[:id])
        end

        #Metodo Strong Parameters para recibir y enviar los datos desde y hacia formulario
        def book_params
            params.require(:book).permit(:title , :author, :status, :date_out, :date_in)
        end

end