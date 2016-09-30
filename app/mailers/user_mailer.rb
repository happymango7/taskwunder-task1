class UserMailer < ApplicationMailer

  def mail_to_dev(user)
    @user = user
    #binding.pry
    attachments["attachment.pdf"] = WickedPdf.new.pdf_from_string(
			render_to_string
		)
    mail to: 'development@taskwunder.com', subject: 'Welcome to TaskWunder'

  end

end
