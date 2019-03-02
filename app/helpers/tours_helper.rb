module ToursHelper
    def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
        html_options[:title] = options[:tooltip]
        html_options[:class] = html_options[:class] || 'tooltip'
        content_tag("span", content, html_options)
        end
    def price_options
        [["0-1999", 1], ["2000-4999", 2], ["5000-9999", 3], ["10000-14999", 4], ["15000+", 5]]
    end
end
