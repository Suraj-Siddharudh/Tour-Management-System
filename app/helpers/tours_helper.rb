module ToursHelper
    def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
        html_options[:title] = options[:tooltip]
        html_options[:class] = html_options[:class] || 'tooltip'
        content_tag("span", content, html_options)
        end
    # def size_options
    #     [["0-500", 1], ["500-1500", 2], ["1500-3000", 3], ["3000+", 4]]
    # end
    # def Price_options
    #     [["0-100 Thousand", 1], ["100-250 Thousand", 2], ["250-500 Thousand", 3], ["500 Thousand - 1 Million", 4], ["1 Million +", 5]]
    # end
end
