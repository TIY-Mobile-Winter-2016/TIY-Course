# Spotify API App

Build a Spotify App using their [API](https://developer.spotify.com/web-api/search-item/)

* Create a textfield that accepts a query on Artist name.
* Create two model objects - Artist and Track
* The Artist must have at least two properties: artistID and name
* Display a list of the top tracks for each artist in a UITableView.
* Use code organization (folders for ViewController and Models)
* Use //MARK: - to help organize the code
* Pull the latest top tracks using the [Top Track API](https://developer.spotify.com/web-api/get-artists-top-tracks/)
* In order to query the api, use q as the parameter and type=artist.

# Notes:

* You must set the App Transport settings in the info.plist to get this working!
* The artist id AND country must be used the URL to make this work. The country code is US (country=US)
* Display a list of at least 5 top tracks returned by the Spotify API.

**Hard Mode**

* Add the album cover images to the App
* Add a detail view with all of the band information for that artist.
