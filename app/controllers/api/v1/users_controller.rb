class Api::V1::UsersController < ApplicationController

    def create
        if params[:password] === params[:password2]
            user = User.new(
                username: params[:username],
                password: params[:password]
            ) 
            if user.save
                render json: {success: "User has been created"}
            else
                if User.find_by(username: params[:username])
                    render json: {error: "That username has already been taken. Please choose another"}
                else 
                    render json: {error: "could not create user"}
                end 
            end 
        else 
            render json: {password: "Your passwords do not match"}
        end 
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.versions.destroy_all
        user.songs.destroy_all
        user.collections.destroy_all
        user.destroy
        render json: {success: 'Account destroyed'}
    end

    # private 

    # def user_params
    #     params.require(:user).permit(:id, :username, :password)
    # end 

end
