class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        sorted_versions = song.versions.order({ created_at: :desc }) 
        render json: sorted_versions
    end

    def create
        collection = Collection.find(params[:collection_id])
        user = collection.user
        song = Song.new(collection_id: params[:collection_id], title: params[:song_title])
        if song.save
            sorted_collections = user.collections.order({ created_at: :desc })
            sorted_songs = user.songs.order({ created_at: :desc })
            render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else 
            # needs error handling 
        end 
    end

    def update
        song = Song.find(params[:id])
        song.title = params[:song_title]
        song.collection_id = params[:collection_id]
        user = song.collection.user
        if song.save
            sorted_songs = user.songs.order({ created_at: :desc })
            sorted_collections = user.collections.order({ created_at: :desc })
            render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else
            ## error handle 
        end 
    end

    def destroy
        song = Song.find(params[:id])
        user = song.collection.user
        song.versions.destroy_all
        if song.destroy
            sorted_songs = user.songs.order({ created_at: :desc })
            sorted_collections = user.collections.order({ created_at: :desc })
            render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else
            ## error handle 
        end 
    end
end
