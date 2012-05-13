module YoutubeLinkHelper
  def thumbnail_url(link)
    content_tag 'img', '' ,alt:'YouTube thumbnail', src: "http://i2.ytimg.com/vi/#{link.video_id}/default.jpg"
  end
end
