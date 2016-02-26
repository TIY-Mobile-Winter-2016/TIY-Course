/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## The Movie Database
*/



import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = false

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [AnyObject]

let dateFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()


func jsonParse(data: NSData?) -> JSONDictionary? {
    do {
        if let data = data,
            dict = try
                NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                    JSONDictionary {
                        return dict
                    }
    } catch {
        print("An error occurred")
    }
    return nil
}

class Movie {
    
    let movieImageURL = "http://image.tmdb.org/t/p/w500/"
    
    var posterPath: String = ""
    var backdropPath: String = ""
    var title: String = ""
    var overview: String = ""
    var movieID: Int = 0
    var voteAverage: Double = 0.0
    var voteCount: Int = 0
    
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [AnyObject]
    
    init(dict: JSONDictionary) {
        
        if let movieID = dict["id"] as? Int {
            self.movieID = movieID
        } else {
            debugPrint("Could not parse id")
        }
        
        if let path = dict["poster_path"] as? String {
            self.posterPath = "\(movieImageURL)\(path)"
        } else {
            debugPrint("Could not parse poster_path")
        }

        if let backPath = dict["backdrop_path"] as? String {
            self.backdropPath = "\(movieImageURL)\(backPath)"
        } else {
            debugPrint("Could not parse backdrop_path")
        }

        if let title = dict["title"] as? String {
            self.title = title
        } else {
            debugPrint("Could not parse title")
        }

        if let overview = dict["overview"] as? String {
            self.overview = overview
        } else {
            debugPrint("Could not parse overview")
        }

        if let average = dict["vote_average"] as? Double {
            self.voteAverage = average
        } else {
            debugPrint("Could not parse average")
        }

        if let voteCount = dict["vote_count"] as? Int {
            self.voteCount = voteCount
        } else {
            debugPrint("Could not parse vote_count")
        }

    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        return "MovieId: \(movieID)\nTitle: \(title)\nOverview: \(overview)\n url: \(posterPath)\n"
    }
}

let apiKey = "f51678dcb1e8e91622ee0f91f733ebb2"

let baseURLString = "http://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"

let url = NSURL(string: baseURLString)

var moviesArray = [Movie]()

if let url = url {
    
    let data = NSData(contentsOfURL: url)
    
    let dict = jsonParse(data)
    
    print(dict)
    
    if let results = dict?["results"] as? JSONArray {
        
        for result in results {
            
            if let jsonResult = result as? JSONDictionary {
                let movie = Movie(dict: jsonResult)
                moviesArray.append(movie)
            }
            
        }
    }
    
    let total_results = dict?["total_results"] as? Int
}

moviesArray.count

for movie in moviesArray {
    movie.posterPath
    print(movie.posterPath)
    movie.title
}



