# app/api/my_api.rb

class Myapi < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    rescue_from :all
    # get '/hello' do
    #    message: 'Hello World' 
    # end

    resource :Myapi do
      desc 'Return a list of books'
      post do
        Book.all()
      end

      desc "Create a Book"
      post '/post' do
        Book.create({name: params[:name],price: params[:price]})
      end
      
      desc "return a Specific Book"
      post ':id' do
        Book.find(params[:id])
      end

      
    
      desc "Update a Book"
      post '/put/:id' do
        book=Book.find(params[:id])
        book.update({name: params[:name],price: params[:price]})
      end

      desc "Delete a status"
      post '/delete/:id' do
        book=Book.find(params[:id])
        book.destroy
      end
    end
end
  