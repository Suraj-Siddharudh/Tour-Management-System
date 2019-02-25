module ToursHelper
    def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
        html_options[:title] = options[:tooltip]
        html_options[:class] = html_options[:class] || 'tooltip'
        content_tag("span", content, html_options)
        end
end
