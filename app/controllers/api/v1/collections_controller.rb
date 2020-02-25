class Api::V1::CollectionsController < ApplicationController
    def create
        user = User.find(params[:user_id])
        collection = Collection.new(collection_name: params[:collection_name], user_id: params[:user_id])
        if collection.save
            sorted_collections = user.collections.order({ created_at: :desc })
            sorted_songs = user.songs.order({ created_at: :desc })
            render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs } 
        else 
            ##error handle 
        end 
    end

    def update
        collection = Collection.find(params[:id])
        collection.collection_name = params[:collection_name]
        if collection.save
            user = collection.user 
            sorted_collections = user.collections.order({ created_at: :desc })
            sorted_songs = user.songs.order({ created_at: :desc })
            render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else 
            ## error handle
        end 
    end

    def destroy
        collection = Collection.find(params[:id])
        user = collection.user 
        collection.songs.each {|song| song.versions.destroy_all }
        collection.songs.destroy_all
        collection.destroy
        sorted_collections = user.collections.order({ created_at: :desc })
        sorted_songs = user.songs.order({ created_at: :desc })
        render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
    end
end
