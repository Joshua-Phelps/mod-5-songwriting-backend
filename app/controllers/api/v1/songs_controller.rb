class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        sorted_versions = song.versions.order({ created_at: :desc }) 
        render json: {song: song, versions: sorted_versions}
    end

    def create       
        song = Song.new(song_params)
        if song.save
            user = song.collection.user
            render json: user 
        else 
            # needs error handling 
        end 
    end

    def update
        song = Song.find(params[:id])
        song.update(song_params)
        user = song.collection.user
        render json: user
    end

    def destroy
        song = Song.find(params[:id])
        user = song.collection.user
        song.versions.destroy_all
        if song.destroy
            render json: user 
        else
            ## error handle 
        end 
    end

    private 

    def song_params
        params.require(:song).permit(:id, :collection_id, :title, :lyrics)
    end 
end
