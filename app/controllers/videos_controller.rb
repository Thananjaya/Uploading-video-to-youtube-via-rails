class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(title: params[:video][:title], description: params[:video][:description], file: params[:video][:file].try(:tempfile).try(:to_path))
    # @video.user_id = current_user.id
    puts "#{@video.errors.full_messages}"
    if @video.save
      uploaded_video = @video.upload!(current_user)
      if uploaded_video.failed?
        flash[:error] = 'There was an error while uploading your video...'
      else
        Video.create({link: "https://www.youtube.com/watch?v=#{uploaded_video.id}"})
        flash[:success] = 'Your video has been uploaded!'
      end
      redirect_to root_url
    else
      render :new
    end
  end
end