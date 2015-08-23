module NotesHelper
  def fancy_format(content)
    sanitize(RDiscount.new(content).to_html)
  end
end
