
class Finder
  def search(search)
    if search.blank?
      return []
    end
    uri = URI("http://www.recipepuppy.com/api/?q=#{search}")
    response = HTTParty.get(uri)
    if response.code < 300
      results = JSON.parse(response.body)['results']
    else
      results = []
    end
  end
end
