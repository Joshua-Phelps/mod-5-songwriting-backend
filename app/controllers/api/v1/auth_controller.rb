class Api::V1::AuthController < ApplicationController

    # Login
      def create
        user = User.find_by(username: params[:login][:login])
        if user && user.authenticate(params[:password][:password])
          # issue that user a token\
          token = issue_token(user)
          sorted_songs = user.songs.order({ created_at: :desc })
          sorted_collections = user.collections.order({ created_at: :desc })
          render json: {user: user, jwt: token}
          # render json: {id: user.id, username: user.username, number_of_collections: user.collections.length, collections: sorted_collections, songs: sorted_songs, jwt: token}
        else
          render json: {error: 'That user could not be found'}, status: 401
        end
      end
      
      
    
      def show
        user = User.find_by(id: user_id)
        if logged_in?
          sorted_songs = user.songs.order({ created_at: :desc })
          sorted_collections = user.collections.order({ created_at: :desc })
          render json: user
          # render json: { id: user.id, username: user.username, number_of_collections: user.collections.length, collections: sorted_collections, songs: sorted_songs }
        else
          render json: {error: 'No user could be found'}, status: 401
        end
      end
    
    
    
    end