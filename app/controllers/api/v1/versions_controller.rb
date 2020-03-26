class Api::V1::VersionsController < ApplicationController
    

    def create
        version = Version.create(title: params[:title], song_id: params[:id])
        version.recording = params[:recording]
        if version.save
            render json: version
        else 
            render json: {error: 'There was a problem'}
        end 
    end

    def update
        version = Version.find(params[:id])
        version.title = params[:title]
        if version.save
            render json: version 
        else
            render json: {error: 'There was a problem'}
        end 
    end

    def destroy
        version = Version.find(params[:id])  
        # directory_to_be_deleted = File.dirname(version.recording.url).split(':')[1]
        # directory_to_be_deleted = 'https:' + directory_to_be_deleted
        # s3 = Aws::S3::Resource.new
        # bucket = s3.bucket(ENV['S3_BUCKET'])
        # bucket.objects(prefix: directory_to_be_deleted).batch_delete!
        version.destroy
        render json: {success: 'deleted'}
    end

end
