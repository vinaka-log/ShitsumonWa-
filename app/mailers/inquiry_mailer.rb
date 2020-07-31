class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'shitsumonwa@example.com',
      to:   'manager@example.com',
      subject: 'Contact notification'
    )
  end
end
