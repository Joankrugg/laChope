class MarketPlacesController < ApplicationController
  before_action :set_market_place, only: [:show, :edit, :update, :destroy]
  def index

    if params[:search].present?
      @market_places = MarketPlace.global_search(params[:search])
      @markers = @market_places.geocoded.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          info_window: render_to_string(partial: "info_window", locals: { place: place })
        }
      end
    else
      @market_places = MarketPlace.all

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @market_places.geocoded.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          info_window: render_to_string(partial: "info_window", locals: { place: place })
        }
      end
    end
  end

  def new
    @market_place = MarketPlace.new
  end

  def create
    @market_place = MarketPlace.new(market_place_params)
    if @market_place.save
      redirect_to root_path
    else
      render :new
    end
  end

  def scrape
    html_file = RestClient.get('http://projet.amertume.free.fr/html/liste_brasseries.htm')
    html_doc = Nokogiri::HTML(html_file)
    g = html_doc.css('#table1').children
    g.css('tr').each do |mp|
      MarketPlace.create(
        name: mp.css('td')[0]&.text.strip,
        zipcode: mp.css('td')[1]&.text.strip,
        city: mp.css('td')[2]&.text.strip,
        website: mp.css('td')[3]&.text.strip
      )
    end
  end

  def show

  end

  def edit

  end

  def update
    @market_place.update(market_place_params)
    if @market_place.save!
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_market_place
    @market_place = MarketPlace.find(params[:id])
  end

  def market_place_params
    params.require(:market_place).permit(:name, :city, :zipcode, :website)
  end
end
