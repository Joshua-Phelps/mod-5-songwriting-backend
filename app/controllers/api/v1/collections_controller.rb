class Api::V1::CollectionsController < ApplicationController
    def create    
        user = User.find(params[:user_id])
        # collection = Collection.new(collection_name: params[:collection_name], user_id: params[:user_id])
        collection = Collection.new(collection_params)
        if collection.save
            render json: user 
        else 
            ##error handle 
        end 
    end

    def update
        collection = Collection.find(params[:id])
        # collection.collection_name = params[:collection_name]
        collection.update(collection_params)
        if collection.save
            user = collection.user 
            render json: user 
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
        render json: user
    end

    private 
    
    def collection_params
        params.require(:collection).permit(:id, :collection_name, :user_id)
    end 
end
