class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @responce = Net::HTTP.get(@uri)
    @coins = JSON.parse(@responce)
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM", "ETH", "BCH", "EOS", "XLM", "LTC", "USDT", "XMR", "ETC"]
  end
  
  def about
  end
  
  def lookup
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @responce = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@responce)
    
    @symbol = params[:sym]
    
    if @symbol 
      @symbol = @symbol.upcase
    end 
    
    if @symbol == ""
      @symbol = "Hey You Forgot To Enter A Currency!"
    end 
  end
  
end
