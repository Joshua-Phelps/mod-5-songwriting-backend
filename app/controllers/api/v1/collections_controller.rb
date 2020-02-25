class Api::V1::CollectionsController < ApplicationController
    def create
        user = User.find(params[:user_id])
        collection = Collection.new(collection_name: params[:collection_name], user_id: params[:user_id])
        collection.save
        render json: { id: user.id, username: user.username, collections: user.collections, songs: user.songs } 
    end
end
