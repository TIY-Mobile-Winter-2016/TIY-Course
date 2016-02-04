# 04 -- 1.21 Gigawatts

## Agenda
### Instructor Commitments
* Has appointment from 3:30pm - 5pm - please ask questions before 3:30 or on Slack after 5pm

### Daily Rituals

* Standup Meeting ~15min
* Homework Review ~30min

### Topics
* Intro to Custom Delegation
* Timers
* Navigation Controllers
* Multiple View Controllers


## Homework - OutaTime

![Great Scott!](http://weknowmemes.com/wp-content/uploads/2011/10/great-scott-doc-back-to-the-future-drawing.jpg)

Great Scott!

The DeLorean's time circuits have been damaged! I bet Biff was in there messing around. In order to get you back to your own time, we'll need to build a new set of time circuits and rig them up to the DeLorean. I think that pocket computer you showed me earlier will do nicely. If you can build a program with an interface for the time circuits, I can give you the mathematical formulas that make time travel possible. All you have to do is enter them into your pocket computer and you'll be on your way back to the future!

Time is a factor here. We've only got 24 hours until lightning is due to strike the clock tower to provide the DeLorean with the 1.21 gigawatts of power needed to activate the time circuits. You've got to get the program built and your pocket computer rigged to the DeLorean before then.

If my calculations are correct, when this baby hits 88 miles per hour... you're gonna see some serious shit.

\- Doc Brown


### Objectives

After completing this assignment, you should…

* Understand how to use a Navigation Controller to manage a stack of views.
* Begin to understand how a custom delegate can be used to pass data between objects.
* Be comfortable using the prepareForSegue method to intercept an in-progress storyboard segue and pass data to the receiving view controller.
* know how to use a timer to execute code after a specified interval.

### Assignment Checklist
```markdown
### Normal Mode

#### Code Changes

* [ ] Add IBOutlets for relevant subviews from the storyboard. Also wire them up to the appropriate UI element.
* [ ] Set the title of the view to "OutaTime".
* [ ] Create a NSDateFormatter constant property and initialize the constant.
* [ ] Set the date formatter's date format.
* [ ] Set the presentTimeLabel to the current date using the date formatter.
* [ ] Create a variable property to store the current speed and set it to 0.
* [ ] Set the speed label to "% MPH", with % being the current speed.
* [ ] Set the lastTimeDeparted label.
* [ ] Set the TimeCircuitsViewController class as implementing the delegate for the date picker.
* [ ] Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepareForSegue method.
* [ ] Call the delegate method to inform the delegate of the new date chosen by the user somewhere in the DatePickerViewController.
* [ ] Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object in the destinationDateWasChosen method.
* [ ] Call the method to start the timer in the IBAction that is called when the travel back button is tapped.
* [ ] In the start timer method, instantiate the timer object for a 0.1 sec time interval. Set it to fire the method that updates the speed label.
* [ ] In the stop timer method, stop the timer (there is a method you can call to do this, and it may not be called _stop_) and then set it to nil.
* In the update speed method:
	* [ ] Check if the current speed variable has reached 88. If we have NOT:
		* [ ] Increment the current speed variable by 1.
		* [ ] Update the speed label with the current speed.
	* [ ] Once the speed has reached at least 88, stop the timer.
		* [ ] Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel.
		* [ ] Update the value of the presentTimeLabel with the value from the destinationTimeLabel.
		* [ ] Reset the value of the current speed variable to 0.
```
## Reminder: Kata 1 Due on Friday end of day (5pm)


