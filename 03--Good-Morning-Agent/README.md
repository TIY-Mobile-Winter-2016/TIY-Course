# 03 -- Good Morning, Agent Hunt

## Agenda

### Daily Rituals

* Standup Meeting ~15min
* Homework Review ~30min

### Topics
* Review - Classes, functions, conditionals
* Introduction to Optionals
* Autolayout
* My First iOS App (from scratch)
	* Storyboards
	* IBOutlets and IBActions
	* UITextFieldDelegate

## Homework - Mission Briefing

Good afternoon agent. This mission will be quite taxing, but you will make your country proud if you complete it. Your job is to create an app to brief future agents on mission details securely and privately. We know this is your first assignment, but be aware that this is a top priority for the agency. The Director herself will be watching the outcome of this assignment, so stay sharp.
See the attached image for an example of what your finished product  will look like. Good luck.

This message will self-destruct in 5 seconds.

### Objectives

After completing this assignment, you should…

* Become familiar with *manipulating view attributes* in the storyboard.
* Understand the basics of applying *autolayout constraints* to subviews.
* Practice _wiring up_ outlets and actions to their associated properties and methods in the view controller.
* Begin to use *standard organizational practices* for *arranging your code* within a class.
* Understand how to *organize code blocks* into functions.

### Assignment Checklist
```markdown
### Normal Mode
#### Storyboard Tasks
* [ ] Add two UITextFields to the top of the view. Have them stretch to 80% of their superview's width.
* [ ] Add a button centered below the textfields. The title should read "Authenticate".
* [ ] Add a centered label below the button - name it greetingLabel.
* [ ] Add a UIImageView and set it to the TIY logo image from your image assets. It should be centered with the rest of the elements.

#### ViewController

* [ ] 1. The UI elements should be set to an "empty string" in viewDidLoad of the ViewController class.
* [ ] 2. The background color of the view should change to green on successful authentication of the agent.![]()
* [ ] 2. The greeting label should display "Good evening, Agent [name]", where the agent's last name is pulled from the textfield.
* [ ] 3. The mission briefing should display the information from MissionBriefing.txt (copy-paste, you don't have to read from the file). It also contains a placeholder for the agent's last name.

### Hard Mode
* [ ] Modify the constraints on the imageview (and possibly other views) to cause the logo to shrink when switching to landscape orientation (the current constraints cause it to float off the bottom of the viewable screen). 
```
