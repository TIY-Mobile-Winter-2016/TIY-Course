# Introduction to Data Persistence

# Using NSFileManager and NSBundle
<br>

```
if let filepathURL = NSBundle.mainBundle().URLForResource("file", withExtension: "txt") {
    print("File Found")
} else {
    print("The File Does not exist")
}
```

## NSFileManager
<br>
```
let fileManager = NSFileManager.defaultManager()

let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)

if let documentDirectory: NSURL = urls.first {
    let documentURL = documentDirectory.URLByAppendingPathComponent("test.txt")

    do {
        let content = try String(contentsOfURL: documentURL)
        print(content)
 
        // Writing to a file
        
        // Create a file url to the new filename
        let mysavedPath = documentDirectory.URLByAppendingPathComponent("mysaveddata.txt")

        let data = NSData() // create an instance of the NSData class
        data.writeToURL(mysavedPath, atomically: true)
    } catch let error as NSError {
        print(error.localizedDescription)
    }
}

```

## Encoding / Decoding
<br>
In order to persist objects that you create in Swift, you must implement the NSCoding protocol. In order to implement the protocol your class must also be a **subclass** on NSObject.

## Step 1 Implementing NSCoding
<br>

```

class Movie: NSObject, NSCoding {
    
    var title: String = ""
    var movieID: Int = 0

    required init?(coder aDecoder: NSCoder) {
        
        self.title = aDecoder.decodeObjectForKey(kTitle) as! String
        self.movieID = aDecoder.decodeIntegerForKey(kMovieID)
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(title, forKey: kTitle)
        aCoder.encodeInteger(movieID, forKey: kMovieID)
    }
}
```

## Step 2 - Using the Archiver

### Archive

```
NSKeyedUnarchiver.unarchiveObjectWithFile(moviesArray, toFile: '/path/to/archive' )
```

### Unarchive

```
let unarchivedMovies = NSKeyedArchiver.archiveRootObject(moviesArray, toFile: '/path/to/archive')
```

 
 