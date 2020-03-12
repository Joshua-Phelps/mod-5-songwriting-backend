class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        sorted_versions = song.versions.order({ created_at: :desc }) 
        render json: {song: song, versions: sorted_versions}
    end

    def create       
        song = Song.new(song_params)
        if song.save
            render json: song
        else 
            render json: {error: "There was some problem"}
        end 
    end

    def update
        song = Song.find(params[:id])
        if song.update(song_params)
            render json: song 
        else 
            render json: {error: "There was some problem"}
        end 
    end

    def destroy
        song = Song.find(params[:id])
        user = song.collection.user
        song.versions.destroy_all
        if song.destroy
            render json: {success: 'destroyed'} 
        else
            render json: {error: 'could not destroy song'}
        end 
    end

    private 

    def song_params
        params.require(:song).permit(:id, :collection_id, :title, :lyrics)
    end 
end
