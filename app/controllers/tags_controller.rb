class TagsController < ApplicationController

  get '/tags' do
    @tags = Tag.all

    "All Tags will be listed here"
  end

  get '/tags/:id' do
    # binding.pry
    @tag = Tag.find_by(:id => params[:id])

    erb :"/tags/show"
  end

end