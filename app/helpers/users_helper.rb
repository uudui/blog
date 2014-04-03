module UsersHelper
  def avatar_url(user, size=48)
    default_url = "https://d17f28g3dsa4vh.cloudfront.net/img/default-avatar.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
