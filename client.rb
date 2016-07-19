require 'httparty'

class Client
  include HTTParty
  base_uri 'https://api.github.com'
  #https://api.github.com/users/martindally/repos
  def initialize(github_username)
   @user = github_username
 end

 def get_user_repo
   self.class.get("/users/#{@user}/repos")
 end

 def print_repos
   result = get_user_repo
   arr = []
   result.each do |repo_name|
     arr.push(repo_name["name"])
   end
   arr
 end
end

# c= Client.new("eadouglas10")
# c.print_repos
