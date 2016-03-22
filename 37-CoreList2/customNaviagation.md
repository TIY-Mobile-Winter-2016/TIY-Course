```
// Step 1
UINavigationBar.appearance().barTintColor = UIColor.redColor()

// Step 2
UINavigationBar.appearance().tintColor = UIColor.whiteColor()

// Step 3
if let barFont = UIFont(name: "Avenir-Next", size: 24.0) {
  UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:barFont]
}

// Optional Step 4
UIApplication.sharedApplication().statusBarStyle = .LightContent

```
