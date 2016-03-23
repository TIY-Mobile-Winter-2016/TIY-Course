# 38 -- LocalRealm

## Agenda

### Daily Rituals

* Standup Meeting ~15min
* Homework Review - Core Data

### Topics

* Local Notifications
* Realm Mobile Database
* Play a sound

```swift

import AVFoundation

if let url = NSBundle.mainBundle().URLForResource("name", withExtension: "caf") {
  playSound(url)
}

func playSound(url: NSURL) {
        
        do {
            let player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
            
            player.numberOfLoops = 1
         	player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }

```

# Resources

[Apple Doc - UILocalNotifications](https://developer.apple.com/library/watchos/documentation/iPhone/Reference/UILocalNotification_Class/index.html)

[Local and Remote Notifications in Depth](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/WhatAreRemoteNotif.html)
[Local Notifications Part 1](http://jamesonquave.com/blog/local-notifications-in-ios-8-with-swift-part-1/)
[Local Notifications Part 2](http://jamesonquave.com/blog/local-notifications-in-ios-8-with-swift-part-2/)
[Realm Swift Documentation](https://realm.io/docs/swift/latest/)
