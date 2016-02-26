# Homework - S.H.I.E.L.D. Hero Tracker

There are now so many _super powered_ people running around that S.H.I.E.L.D. needs a way to keep track of them. Build a tableview-based app that shows a list of heroes, with the data read from a JSON file included in the app. When the user taps on a given hero, show a detail view that lists all the important stats for the powered person.

### Objectives

After completing this assignment, you should…

* know how to use a UITableViewController to display a list of related data
* be able to create a model class to store information and easily transport this info around the app.
* have more practice with autolayout (esp. if you tackle the hard mode)
* know how to read in JSON data from a file included in the app
* begin to understand how to handle possible errors using a do-try-catch block

### Assignment Checklist
```markdown
### Normal Mode

#### Storyboard Tasks
* [ ] Remove the view in the storyboard from the template
* [ ] Add a Table View Controller to the canvas
* [ ] Embed the above in a Navigation Controller
* [ ] Add a second View Controller, to be used as the table's detail view
* [ ] The table view cell prototype should display two labels. One on the left of the cell and one on the right.
	* [ ] The table view cell prototype should have a disclosure indicator
	* [ ] The table view cell prototype should have its reuse indentifier set (hint: this should match the identifier set in "cellForRowAtIndexPath")
* [ ] The detail view should have a custom class name of "HeroDetailViewController". See the identity inspector in Interface Builder.
* [ ] The detail view should have 3 labels:
	* [ ] A label in the upper left corner that displays the hero's name
	* [ ] A label 20 pts below the cover name label that displays the hero's homeworld
	* [ ] A label the standard distance (8 pts) from the homeworld label that displays the hero's powers (be sure to set the label to _0 lines_ in the attributes inspector, as it will allow you to display more than 1 line)
	* [ ] These labels should be connected to their appropriate properties in the HeroDetailViewController class.

#### Code Tasks
* [ ] Remove the _ViewController.swift_ file from the project
* [ ] Add a new Table View Controller subclass called _HeroTableViewController_
* [ ] Add a new View Controller subclass called _HeroDetailViewController_
* [ ] Add a new swift class called "Hero"
* [ ] Add the _heroes.json_ file to the project
* In _HeroTableViewController_:
	* [ ] Create a property to store custom _Hero_ models
	* [ ] Set the title to "S.H.I.E.L.D. Hero Tracker"
	* [ ] Call the private method _loadHeroes()_
	* [ ] Create a private method called _loadHeroes()_
		* [ ] Load the JSON file into a local array
		* [ ] Create a for loop that iterates over each dictionary in the array and creates a hero object. Add each hero to the _heroes_ array property
		* [ ] Sort the _heroes_ array in place to alphabetize the list by hero name
	* [ ] Implement the three tableview datasource methods to get each hero in the _heroes_ array to display in the table with the name in the cell's left label and their homeworld in the cell's right label.
	* [ ] Implement the _didSelectRowAtIndexPath_ tableview delegate method to transition to the detail view. Be sure to send the appropriate hero object to the detail view controller before you inititate the transition.
* In _HeroDetailViewController_:
	* [ ] Create three IBOutlet properties: _nameLabel_, _homeworldLabel_, and _powersLabel_ and wire them up to the appropriate labels in the storyboard.
	* [ ] Add a property called _hero_ that is a Hero optional.
	* [ ] Take the name, homeworld and powers from the hero property and set them to their appropriate label onscreen.

### Hard Mode

* [ ] Add a UIImageView to the detail view to display an avatar-style image of the hero. See the screenshot _hardmode.png_ in today's folder for a guide on how to place it in the view.
* [ ] Find images for each hero on Google image search or similar, add the image files to the project, and then add a fourth key:value pair to the JSON for each hero with the filename of the associated image.
	* [ ] Add a property to the Hero model class to store this filename (as a String)
	* [ ] In the _loadHeroes()_ function, pull this value from the dictionary each time through the loop and store it in your new model property
	* [ ] In the same place in _HeroDetailViewController_ where you set the three labels, add another instruction that uses the filename property from the model object to load the appropriate image into the UIImageView.
	
