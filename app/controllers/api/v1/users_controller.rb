class Api::V1::UsersController < ApplicationController

    def index
        
    end

    def create
        user = User.new(
            username: params[:username][:username],
            password: params[:password][:password]
        )
        if user.save
            render json: {success: "User has been created"}
        else
            render json: {error: "could not create user"}
        end 
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
end
