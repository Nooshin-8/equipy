class SearchResultsController < ApplicationController
  def index
    query = params[:query].downcase
    @results = policy_scope(Equipment)
    @results = Equipment.where("lower(title) LIKE ? OR lower(description)LIKE ?", "%#{query}%", "%#{query}%")
  end
end
