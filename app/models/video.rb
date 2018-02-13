class Video < ApplicationRecord
  belongs_to :user
  def upload!(user)
    account = Yt::Account.new access_token: user.token
    account.upload_video self.file, title: self.title, description: self.description
  end

  def getinfo(resource)
    video = Yt::Video.new url: resource.link
    self.update(uid: video.id, likes: video.like_count, dislikes: video.dislike_count, published_at: video.published_at)
    rescue Yt::Errors::NoItems
      resource.title = ''
  end
end
