require './dependencies.rb'

class App < Sinatra::Base
  get "/" do
    repos = ""
    user = params["name"]
    ERB.new(File.read("./homepage.html.erb")).result(binding)
  end

  get "/pretty_colors.css" do
    File.read("./styles.css")
  end

  post "/get_repos" do
    user = params["name"]
    repos = Client.new(user).print_repos

    ERB.new(File.read("./homepage.html.erb")).result(binding)
  end

  run! if app_file == $PROGRAM_NAME

end
