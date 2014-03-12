class GeneratorController < ApplicationController
  def index
  	@authors 	= Author.all
  	@tags 		= Tag.all
  end

  def show

  end

  def search

  	@authors 	= Author.all
  	@tags 		= Tag.all

  	search = params[:search]
  	@author_name = search[:author]

  	@samples = Sample.find_all_by_author (@author_name)
  	# @tag 	= Sample.find_all_by_tag search[:theme]
  	dict =  ""
	@samples.each { |s| dict << s.body } 

	markov = MarkyMarkov::TemporaryDictionary.new
	markov.parse_string dict
	@sentence = markov.generate_n_sentences 2
	markov.clear! # Clear the temporary dictionary.

  end


end
