class UserMailer < ActionMailer::Base
  default :from => "hupengxing.com<norelpy@hupengxing.com>",
    :reply_to => 'hupengxing@gmail.com',
  "X-Time-Code" => Time.now.to_i.to_s
  
  def comment(blog, comment)
    @blog, @comment = blog, comment
    mail(:to => "#{comment.parent.email}", :subject => "有人回复了您在hupengxing.com的评论") do |format|
      format.html {render :template => 'user_mailer/comment'}
    end
  end
end
