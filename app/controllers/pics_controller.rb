class PicsController < ApplicationController



  def show
    @pic = Pic.find(params[:id])
  end

  def new

  end


  # def upload
  #   uploaded_file = params[:photo]
  #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
  #     file.write(uploaded_file.read)
  #   end
  # end

  def create
    @pic = Pic.new(article_params)

    @pic.save
    redirect_to @pic
  end

  private

  def article_params
    params.require(:photo).permit(:comment, :picture)
  end
end
