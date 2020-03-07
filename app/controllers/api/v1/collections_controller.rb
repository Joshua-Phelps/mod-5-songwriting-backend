class Api::V1::CollectionsController < ApplicationController

    def create    
        collection = Collection.new(collection_params)
        if collection.save
            render json: collection
        else 
            ##error handle 
        end 
    end

    def update
        collection = Collection.find(params[:id])
        # collection.collection_name = params[:collection_name]
        collection.update(collection_params)
        if collection.save
            render json: collection
            # user = collection.user 
            # render json: user 
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
        render json: {collections: sorted_collections, songs: sorted_songs}
        # render json: {success: 'detroyed'}
        # render json: user
    end

    private 
    
    def collection_params
        params.require(:collection).permit(:id, :collection_name, :user_id)
    end 
end
