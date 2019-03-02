class ConfirmationMailer < ApplicationMailer
     default from: 'touringapp1234@gmail.com'
    #   @bookmark = bookmark	 
    #  @user = User.where(id: Query.find(bookmark.user_id).pluck(:user_id))	

    def new_confirmation_mail
        puts "--------------------------*-*-*-*----------------------------------"
        puts params
        puts "--------------------------*-*-*-*----------------------------------"
        puts params[:bookmark]
        email_id = User.where(id: params[:bookmark]).pluck(:email)
        puts "--------------------------*-*-*-*----------------------------------"
        mail(to: email_id, subject: 'Congratulations!!!! You got your tickets booked.. Yay!!!!')
        puts email_id
     end
end
