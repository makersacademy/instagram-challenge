class PicturesController < ApplicationController

	# has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	# validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		if @picture.save
			redirect_to "/pictures"
		else
			render "new"
		end
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		@picture.update(picture_params)
		redirect_to "/pictures/#{@picture.id}"
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		flash[:notice] = 'Picture has been deleted'
		redirect_to "/pictures"
	end

	private

		def picture_params
			params.require(:picture).permit(:image, :name, :description)
		end

end
