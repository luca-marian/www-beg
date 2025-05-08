# frozen_string_literal: true

module ApplicationHelper
  # def current_total_generation
  #   ActiveRecord::Base.connection.execute("select sum(production) from current_power_generation").to_a.dig(0, "sum")
  # rescue
  #   "N/A"
  # end
  
  def current_total_generation
    result = ActiveRecord::Base.connection.execute("SELECT SUM(production) FROM current_power_generation").first
    result["sum"] || "N/A"
  rescue
    "N/A"
  end

  def projects_sort_link(column:, label:)
    link_to(label, list_projects_path(column: column))
  end

  # def static_asset(asset)
  #   case asset
  #   when /\.css\z/
  #     content_tag(:link, nil,
  #       href: "//" + Cms::Application.config.assets_host + asset,
  #       rel: "stylesheet")
  #   when /\.js\z/
  #     content_tag(:script, nil, src: "//" + Cms::Application.config.assets_host + asset)
  #   else
  #     ""
  #   end.html_safe
  # end
end
