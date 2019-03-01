module ToursHelper
    def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
        html_options[:title] = options[:tooltip]
        html_options[:class] = html_options[:class] || 'tooltip'
        content_tag("span", content, html_options)
        end
    def price_options
        [["0-3.0", 1], ["2.0-3.0", 2], ["3.0-4.0", 3], ["4.0 - 10", 4], ["10 +", 5]]
    end
end
