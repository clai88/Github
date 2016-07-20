require './dependencies.rb'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

class GithubTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Client
  end

  def test_mountains_are_mountains
    assert true
  end

  def test_users_github_repos_correctly_listed
    c= Client.new("eadouglas10")

    assert_equal ["bob_test", "Close-Your-Issues", "Currency", "Employee-Reviews", "Employee-Reviews-w-Database", "Github-Profile", "Hangman", "Koan-Practice", "Numbers-Guessing-Game", "practice-repo", "RailsJune2016", "Sinatra", "Weather-API"], c.print_repos

  end

end
