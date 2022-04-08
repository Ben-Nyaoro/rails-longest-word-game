require 'open-uri'
require 'json'

class GamesController < ApplicationController
	def index
		
	end

	def new
		@letters = ("A".."Z").to_a.sample(10)
	end

	def score
		@word = (params[:word]).upcase
		@letters = params[:letters]

			if included?(@word, @letters)
				if valid_word?(@word)
					@response = "🥳🥳🤑🤩 Well done! \"#{@word}\ is a valid English word!"
				else
					@response = "😏 Sorry but \"#{@word}\" isn't an English word."
				end
			elsif
				@response = "🔎 Sorry but \"#{@word}\" cannot be built out of #{@letters}."
			else
				@response = "😞Sorry, you did not enter any word, please try again"
			end
   end

private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

	def valid_word?(word)	
		response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
	end
end
