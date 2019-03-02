class ConfirmationMailer < ApplicationMailer
     default from: 'touringapp1234@gmail.com'
    #   @bookmark = bookmark	 
    #  @user = User.where(id: Query.find(bookmark.user_id).pluck(:user_id))	

    def new_confirmation_mail
        puts "--------------------------*-*-*-*----------------------------------"
        puts params
        puts "--------------------------*-*-*-*----------------------------------"
        puts params[:user_id]
        email_id = User.where(id: params[:user_id]).pluck(:email)
        puts "--------------------------*-*-*-*----------------------------------"
        mail(to: email_id, subject: 'New Reply on your Enquiry')
        puts email_id
     end
end
