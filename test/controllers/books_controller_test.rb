require 'test_helper'

class BooksControllerTest < ActionController::TestCase
    #Test para controlador Index
    test 'get index' do
        get :index
        #Rails responda de manera satisfactoria cuando llamamos la acción
        assert_response :success
        #probaremos que se está renderizando la vista de manera correcta
        assert_template :index
        #testear que se pasen correctamente los valores de @books hacia la vista
        assert_not_nil assigns(:books)
    end

     #test para accion create
     test 'book create' do
        params = {
            title: "Another Title",
            author: "Jane Doe",
            status: 'EN ESTANTE',
            date_out: DateTime.now,
            date_in: DateTime.now,
            created_at: DateTime.now,
            updated_at: DateTime.now
        }

        post :new, params: {book: params}

        assert_response :success
    end
end