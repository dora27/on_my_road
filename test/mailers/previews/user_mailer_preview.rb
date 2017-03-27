class UserMailerPreview < ActionMailer::Preview
  def validation
    user = User.first #to update with particular situation of the app
    UserMailer.validation(user)
  end
end
