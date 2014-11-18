class PrivateWikiController < ApplicationController
  def new
    @wiki = Wiki.new
    @wiki.personal = true
  end

  def create

  end

  def show
  end

  def index
    @wikis = Wiki.all
  end
end
