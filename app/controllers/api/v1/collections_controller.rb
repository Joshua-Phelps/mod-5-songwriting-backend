class Api::V1::CollectionsController < ApplicationController

    def create    
        collection = Collection.new(collection_params)
        if collection.save
            render json: collection
        else
            render json: {error: "There was some problem"} 
        end 
    end

    def update
        collection = Collection.find(params[:id])
        collection.update(collection_params)
        if collection.save
            render json: collection
        else 
            render json: {error: "There was some problem"}
        end 
    end

    def destroy
        collection = Collection.find(params[:id])
        user = collection.user 
        collection.songs.each {|song| song.versions.destroy_all }
        collection.songs.destroy_all
        collection.destroy
        render json: {success: 'deleted'}
    end

    private 
    
    def collection_params
        params.require(:collection).permit(:id, :collection_name, :user_id)
    end 
end
