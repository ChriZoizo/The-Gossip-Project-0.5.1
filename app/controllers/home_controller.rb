class HomeController < ApplicationController
  def index
    @gossips = Gossip.all
  end
end
