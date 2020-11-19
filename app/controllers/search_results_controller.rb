class SearchResultsController < ApplicationController
  def index

    @equipment = policy_scope(Equipment).order(created_at: :desc)

    if params[:query].present?
      @equipment = Equipment.main_search(params[:query]) # The method inside our model
    else
      @equipment = Equipment.all
    end
  end
end
