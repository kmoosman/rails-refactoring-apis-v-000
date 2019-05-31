class RepositoriesController < ApplicationController
  before_action :set_token

    def index
      github = GithubService.new(@token)
      @username = github.get_username
      @repositories = github.get_repos
    end

    def create
      github = GithubService.new(@token)
      github.create_repo(params[:name])

      redirect_to root_path
    end

    private

      def set_token
        @token = {'access_token' => session[:token]}
      end
end
