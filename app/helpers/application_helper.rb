module ApplicationHelper

  def enable_charts
    content_for(:head) do
      stylesheet_link_tag "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
      javascript_include_tag "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
      javascript_include_tag "./assets/js/charts-lines.js"
      javascript_include_tag "./assets/js/charts-pie.js"
    end
  end
end
