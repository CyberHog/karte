class ContactMailer < ActionMailer::Base
  default from: "example@example.com"
  default to: "sakaoka.g.396@gmail.com"
     
  def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
  end
     
end
