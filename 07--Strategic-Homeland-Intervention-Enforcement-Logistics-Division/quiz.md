### Given all of the statements in a playground, which of the following would produce an error?

```swift
let a = 42
let b: Double = 100.25
let c = a + b
let d = a + 12
```
### What does the showBirthdayMessage function print to the console?

```swift
func happyBirthday(age: Int) -> Int
{
    age = age + 1;
    return age;
}

func showBirthdayMessage()
{
    var age = 25;
    age = happyBirthday(age);
    print("Happy Birthday! You are now \(age) years old.");
}
```

### Using the dateformatter and date objects below, how would you convert the date to something that can be displayed in a label?

```swift
let dateFormatter = NSDateFormatter()

dateFormatter.dateStyle = NSDateFormatterStyle.shortStyle

let today = NSDate()

presentTimeLabel.text = ?
```

