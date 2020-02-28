class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        render json: song
        # sorted_versions = song.versions.order({ created_at: :desc }) 
        # render json: {versions: sorted_versions, song: song}
    end

    def create
        collection = Collection.find(params[:collection_id])
        user = collection.user
        song = Song.new(collection_id: params[:collection_id], title: params[:song_title], lyrics: ' ')
        if song.save
            # sorted_collections = user.collections.order({ created_at: :desc })
            # sorted_songs = user.songs.order({ created_at: :desc })
            render json: user 
            # render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else 
            # needs error handling 
        end 
    end

    def update
        
        song = Song.find(params[:id])
        if params[:lyrics]
            song.lyrics = params[:lyrics]
            song.save
            render json: song 
        else 
            song.title = params[:song_title]
            song.collection_id = params[:collection_id]
            user = song.collection.user
            if song.save
                render json: user 
                # sorted_songs = user.songs.order({ created_at: :desc })
                # sorted_collections = user.collections.order({ created_at: :desc })
                # render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
            else
                ## error handle 
            end 
        end
    end

    def destroy
        song = Song.find(params[:id])
        user = song.collection.user
        song.versions.destroy_all
        if song.destroy
            render json: user 
            # sorted_songs = user.songs.order({ created_at: :desc })
            # sorted_collections = user.collections.order({ created_at: :desc })
            # render json: { id: user.id, username: user.username, collections: sorted_collections, songs: sorted_songs }
        else
            ## error handle 
        end 
    end
end
