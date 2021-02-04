def tag_names(html)
  return html.gsub(/((?<=<)(?!\/))(.*?)((?=\s)|(?=>))/).to_a.uniq
end

