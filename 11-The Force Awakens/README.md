### 11 -- The Force Awakens

## Agenda

### Instructor Commitments
* I have a meeting at 4pm - please ask all questions prior to that time.

### Daily Rituals

* Standup Meeting ~15min
* Homework Review


### Topics

* MVC - Model - View - Controller (Seperation of Concerns)
* DRY - Don't Repeat Yourself
* Custom cell classes

## Homework - Star Wars Cells

### Normal Mode

Create a single view application that shows a list of characters from the new Star Wars movie, The Force Awakens in a tableview.

### JSON

Create a JSON file with the following information in it: 
Character Name, description, the filename of an image for that character.

Each cell in the tableiview character must display an image, a description of the character and the name of the character.

### Three Different Custom TableviewCells
Create three different subclasses of UITableViewCell for each character. Each one will display the character in a different way. For example, one may have the image on the left, one may have the image on the right and one might not have an image -- it is up to you.

### Hint
Start with the most trivial implementation of the tableview (default tableviewcell) and build from there, one step at a time.

### Objectives

After completing this assignment, you should…

* have additional practice with model classes, creating JSON files and reading from them, and showing a tableview of data in a straightforward way to the user.

### Assignment Checklist
```markdown

#### Normal Mode

* [ ] Create a JSON file to use for your input data
* [ ] Read in the JSON file in the view controller and create a model object for each record.
* [ ] Display the name and one of the attributes in a default cell

#### Hard Mode

* [ ] Create a new View Controller, with a detailed profile of the character. Pass only one variable to the class to display the information.
