# 18 - Movies!
## Agenda

### Daily Rituals

* Standup Meeting ~15min

### Topics
* Reviewing what we have learned so far
* Protocol / Delegate Review

### Homework 
### Movie App - Part 2

Create a MovieApp using the api provided by http://api.themoviedb.org.

Create a new Movie Model class.

Use the baseURL for the most popular movies. Make sure to use your apiKey from when you signed up for the service.

let baseURL = "http://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"

Parse the results (20 movies) into an array of your Movie Model class. Use the techniques we learned in class.

DO NOT Copy and Paste code!

You will need to use the image returned from the "poster_path" key to get the full url of each poster. (hint append "http://image.tmdb.org/t/p/w500/") to the start of the string returned.

```markdown

* [ ] Create a MovieViewController with a UITableView that displays the poster image and the name of the movies.
* [ ] Create a DetailViewController that is passed a Movie Model object and display a detailed view of the Movie.
* [ ] Create a new class called "MovieAPI" to load the movies asynchronously. Pass the full array of movies to the MovieViewController to display.
```

