class TagsController < ApplicationController

  get '/tags' do
    @tags = Tag.all

    "All Tags will be listed here"
  end

  get '/tags/:slug' do
    @tag = Tag.find_by_slug(params[:slug])

    erb :"/tags/show"
  end

end