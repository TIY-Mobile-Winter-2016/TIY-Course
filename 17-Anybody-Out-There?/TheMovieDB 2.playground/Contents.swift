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

struct Movie {
    
    let movieImageURL = "http://image.tmdb.org/t/p/w500/"
    
    let posterPath: String?
    let backdropPath: String?
    let title: String?
    let overview: String?
    let movieID: Int?
    let voteAverage: Double?
    let voteCount: Int?
    
    typealias JSONDictionary = [String:AnyObject]
    
    init(jsonDictionary: JSONDictionary) {
        
        self.movieID = jsonDictionary["id"] as? Int
        
        if let path = jsonDictionary["poster_path"] as? String {
            self.posterPath = "\(movieImageURL)\(path)"
        } else {
            self.posterPath = ""
        }
        
        self.backdropPath = jsonDictionary["backgdrop_path"] as? String
        self.title = jsonDictionary["title"] as? String
        self.overview = jsonDictionary["overview"] as? String
        self.voteAverage = jsonDictionary["vote_average"] as? Double
        self.voteCount = jsonDictionary["vote_count"] as? Int
    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        return "MovieId: \(movieID)\nTitle: \(title)\nOverview: \(overview)\n url: \(posterPath)\n"
    }
}

let apiKey = "f51678dcb1e8e91622ee0f91f733ebb2"

let baseURL = "http://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"

let url = NSURL(string: baseURL)

var moviesArray = [Movie]()

if let url = url {
    let data = NSData(contentsOfURL: url)
    
    let dict = jsonParse(data)
    
    if let results = dict?["results"] as? JSONArray {
        for result in results {
            
            if let jsonResult = result as? JSONDictionary {
                let movie = Movie(jsonDictionary: jsonResult)
                
                debugPrint(movie)
                
                moviesArray.append(movie)
            }
            
            //print(result)
            
            if let movieId = result["id"] as? Int {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let original_title = result["original_title"] as? String {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let overview = result["overview"] as? String {

            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let title = result["title"] as? String {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let vote_average = result["vote_average"] as? String {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let vote_count = result["vote_count"] as? Int {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let poster_path = result["poster_path"] as? String {
                
            } else {
                debugPrint("Could not parse movieID")
            }
            
            if let release_date = result["release_date"] as? String {
                
            } else {
                debugPrint("Could not parse movieID")
            }
        }
    }
    
    let total_results = dict?["total_results"] as? Int
}

moviesArray.count

for movie in moviesArray {
    print(movie.title!)
}



