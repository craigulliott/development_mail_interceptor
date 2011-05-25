class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    raise 'please set the DEVELOPER_EMAIL environment variable to catch emails' unless ENV['DEVELOPER_EMAIL']
    message.to = ENV['DEVELOPER_EMAIL']
  end
end

if Rails.env.development?
  Mail.register_interceptor(DevelopmentMailInterceptor) 
end
