class Api::V1::UsersController < ApplicationController

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
end
