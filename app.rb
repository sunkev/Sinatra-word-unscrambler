$: << File.dirname(__FILE__) + "/scrabble"
require 'sinatra'
require 'scrabble'

get '/' do
  erb :index
end

post '/solve' do
  new_input = Scrabble.new(params[:letters])
  @number = new_input.answer_count
  @answer = new_input.answer

  erb :solve
end