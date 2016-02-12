## Calculator Brain (Part 2 of 2)

Weekend Assignment: Continue building your calculator app -- by adding the functional buttons. Ensure your class is called "CalculatorBrain"

Your calculator should have buttons for numbers 0 - 9 (plus a . button so you can add floating point numbers) as well as 7 operator buttons (addition, subtraction, multiplication, division, and equals, plus/minus, percent). It should also have a button to clear out the current transaction (clear). It will need a label to display the current value of the calculator. It should operate as you would expect from a normal calculator.

### Objectives

After completing this assignment, you should…
* Have a better understanding of the M-V-C (Model View Controller)
* understand how to create classes devoted purely to business logic.

### Assignment Checklist

#### Code Tasks

* [ ] Create IBActions for each operand and operator button so you can respond whenever the user taps a button.
* [ ] Create a class called CalculatorBrain to hold state information about the current calculation. An object of this type will be created and destroyed as each "calculation transaction" is performed by the user.
* [ ] As the user enters information, redirect the operands and operators to the CalculatorBrain class so when they tap the _=_ button, the brain will be ready to perform the calculation.
* [ ] Perform the calculation and return an answer to the view controller for display on-screen.
