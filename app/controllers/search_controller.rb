class SearchController < ApplicationController

  def search
    flickr_response = flickr.photos.search(
      tags:     params[:search_text],
      page:     1,
      per_page: 30
    )

    photos = flickr_response.to_a.map do |photo|
      { big_url: generate_photo_url(photo, 'b'), thumbnail_url: generate_photo_url(photo, 'q') }
    end

    render json: photos

  end


  private
  
    # takes photo's json info and converts it into
    # actual urls according to flickr's API docs here: https://www.flickr.com/services/api/misc.urls.html  
    def generate_photo_url(photo, size)
      "http://farm#{photo['farm']}.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_#{size}.jpg"
    end

end
