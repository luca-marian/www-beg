# frozen_string_literal: true

class ProjectsController < ApplicationController
  ALLOWED_COLUMNS = %w[title cost begin_at end_at created_at updated_at].freeze

  def list
    column = params[:column]
    sort_column = ALLOWED_COLUMNS.include?(column) ? column : 'created_at'

    projects = Project.order(sort_column => :asc)
    render(partial: 'projects/index', locals: { projects: })
  end
end