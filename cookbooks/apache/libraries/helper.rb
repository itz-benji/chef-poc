require 'net/smtp'

module HandlerSendEmail
  class Helper

    def send_email_on_run_failure(node_name)

      message = "From: Chef <itzbenji@gmail.com>\n"
      message << "To: Ben <itzbenji@gmail.com>\n"
      message << "Subject: Chef run failed\n"
      message << "Date: #{Time.now.rfc2822}\n\n"
      message << "Chef run failed on #{node_name}\n"
      Net::SMTP.start('smtp.gmail.com', 465) do |smtp|
        smtp.send_message message, 'itzbenji@gmail.com', 'itzbenji@gmail.com'
      end	
    end

    def send_email_on_run_complete(node_name)

      message = "From: Chef <itzbenji@gmail.com>\n"
      message << "To: Ben <itzbenji@gmail.com>\n"
      message << "Subject: Chef run succeeded"
      message << "Date: #{Time.now.rfc2822}\n\n"
      message << "Chef run completed on #{node_name}\n"
      Net::SMTP.start('smtp.gmail.com', 465) do |smtp|
        smtp.send_message message, 'itzbenji@gmail.com', 'itzbenji@gmail.com'
      end
    end
  end
end
