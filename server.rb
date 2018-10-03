require 'sinatra'
require 'pony'

post '/contact' do

  Pony.mail(
    :from => params[:name] + "<" + params[:email] + ">",
    :to => 'robins.blogs@gmail.com',
    :subject => params[:name] + " has contacted you",
    :body => params[:message],
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.sendgrid.net',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['SENDGRID_USERNAME'],
      :password             => ENV['SENDGRID_PASSWORD'],
      :authentication       => :plain,
      :domain               => 'https://isaac-contact.herokuapp.com/'
    })

end

get '/' do
  puts "Isaacs portfolio backend"
end
