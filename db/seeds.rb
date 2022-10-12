movies = [
  "batman",
  "superman",
  "spiderman",
  "wonder woman",
  "thor",
  "black panther",
  "avengers",
  "harry potter",
  "lord of the rings",
  "godfather",
  "once upon a time",
  "pirates of the caribbean",
  "sherlock holmes",
  "star wars",
  "breaking bad",
  "game of thrones",
  "pulp fiction",
  "jackie brown",
  "kill bill",
  "django unchained",
  "the hateful eight",
  "death proof",
  "inglourious basterds",
  "reservoir dogs"
]

movies.each do |movie|
  omdb_endpoint = "http://www.omdbapi.com/?s=#{movie}&apikey=a881ace5"

  serialized_data = URI.parse(omdb_endpoint).open.read
  results = JSON.parse(serialized_data)["Search"]

  results.each do |result|
    next if result["Type"] != "movie" || result["Poster"] == "N/A"

    Movie.create(title: result["Title"], year: result["Year"].to_i, image_url: result["Poster"])
  end
end
