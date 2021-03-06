class PagesController < ApplicationController

  def home

    @destinations = Destination.popular_destinations
  end

  def analytics
    set_analytics
  end


  private 

  def set_analytics
    if Trip.all.count > 0
      @users = User.all
      @destinations = Destination.all
      @trips = Trip.all
      @most_popular_destinations = Destination.all.handles_tie_for_most_popular
      @thirties = @users.avg_budget_per_age_range("1930-01-01", "1939-12-31")
      @forties = @users.avg_budget_per_age_range("1940-01-01", "1949-12-31")
      @fifties = @users.avg_budget_per_age_range("1950-01-01", "1959-12-31")
      @sixties = @users.avg_budget_per_age_range("1960-01-01", "1969-12-31")
      @seventies = @users.avg_budget_per_age_range("1970-01-01", "1979-12-31")
      @eighties = @users.avg_budget_per_age_range("1980-01-01", "1989-12-31")
      @nineties = @users.avg_budget_per_age_range("1990-01-01", "1999-12-31")
      @avg_guest_amount = @trips.avg_number_of_guests_per_trip
      @all_the_cities = @destinations.all_cities
      @city_and_visits = @destinations.total_trips_to_each_destination(@all_the_cities)
    else 
      redirect_to '/signup'
    end
  end
   

end