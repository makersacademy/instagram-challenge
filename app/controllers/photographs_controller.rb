class PhotographsController < ApplicationController
  def new
    @photograph = Photograph.new
  end

  def create
    key = photo_params[:aws_key]
    route = params[:photograph][:photo_upload].tempfile.path
    s3 = s3()
    obj(name = key).upload_file(route)

    # s3 = Aws::S3::Resource.new(region:'us-west-2')
    # obj = s3.bucket('instagram-clone-images').object('dont touch my garbage')
    # obj.upload_file('/Users/malachygilchrist/Desktop/test_upload.png')

    # Photograph.create(photo_params)
    # redirect_to welcome_images_url
  end

  private

  def photo_params
    aws_key = params[:photograph][:photo_upload].original_filename
    user_id = session[:user_id]
    { aws_key: aws_key, user_id: user_id }
  end

  def s3(region = 'us-west-2')
    Aws::S3::Resource.new(region: region)
  end

  def obj(bucket = 'instagram-clone-images', name = "default-#{Photograph.all.length}")
    s3.bucket(bucket).object(name)
  end

end
