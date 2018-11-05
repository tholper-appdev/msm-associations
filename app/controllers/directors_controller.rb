class DirectorsController < ApplicationController
  def index
    @directors = Director.all

    render("director_templates/index.html.erb")
  end

  def show
    @director = Director.find(params.fetch("id_to_display"))

    @movies = Movie.where(:director_id => @director.id)
    @movie_count = Movie.where(:director_id => @director.id).count
    
    render("director_templates/show.html.erb")
  end

  def new_form
    render("director_templates/new_form.html.erb")
  end

  def create_row
    @director = Director.new

    @director.dob = params.fetch("dob")
    @director.name = params.fetch("name")
    @director.bio = params.fetch("bio")
    @director.image_url = params.fetch("image_url")
    @director.save

    redirect_to("/directors", :notice => "Director created successfully.")
  end

  def edit_form
    @director = Director.find(params.fetch("prefill_with_id"))

    render("director_templates/edit_form.html.erb")
  end

  def update_row
    @director = Director.find(params.fetch("id_to_modify"))

    @director.dob = params.fetch("dob")
    @director.name = params.fetch("name")
    @director.bio = params.fetch("bio")
    @director.image_url = params.fetch("image_url")
    @director.save

    redirect_to("/directors/#{@director.id}", :notice => "Director updated successfully.")
  end

  def destroy_row
    @director = Director.find(params.fetch("id_to_remove"))

    @director.destroy

    redirect_to("/directors", :notice => "Director deleted successfully.")
  end
end
