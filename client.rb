require 'httparty'
require 'pry'

class Client
  include HTTParty
  base_uri 'https://api.github.com'
  #https://api.github.com/users/clai88/repos
  def initialize(github_username)
    @user = github_username
  end

  def get_user_repo
    self.class.get("/users/#{@user}/repos")
  end

  def retrieve_repos
    result = get_user_repo
    arr = []
    #  binding.pry
    result.each do |repo_name|
      arr.push(repo_name["name"])
    end
    arr
  end

  def retrieve_repo_url
    result = get_user_repo
    repo_name = retrieve_repos
    repo_urls = []
    repo_name.each do |repo|
      url = "https://github.com/#{@user}/#{repo}"
      repo_urls.push(url)
    end
    p repo_urls
  end

  def retrieve_picture
    result = get_user_repo
    result[0]["owner"]["avatar_url"]
  end
end

c= Client.new("eadouglas10")
c.retrieve_repo_url
