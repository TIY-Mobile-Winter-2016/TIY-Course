Good Advice

http://www.raywenderlich.com/53962/ios-interview-questions


Reddit
https://www.reddit.com/r/iOSProgramming/comments/2m9fqt/what_questions_are_you_asked_when_interviewed_for/


I'm currently interviewing Jr. level devs (both ios and android), and my usual tech interview format is:

A few questions regarding general experience in software development

General algorithms questions, things like runtime complexity, and asking them to pseudo-code a basic task.

General design patterns questions, with a focus on ios/android specific patterns.

For iOS specific stuff, I will usually ask things around

fast enumeration

protocols/categories/extensions

autolayout

I'll also give some technical questions, and since our apps deal with a lot of asynchronous network calls, there's a lot of "given this JSON, make a concrete object", what happens if this call fails, etc.

I'll also present some debugging tasks, like:
give them a snippet of code with varying levels of errors/issues, and ask them to identify and/or solve them

present a crash log (symbolicated, i am not evil), and ask them what steps they'd first take to resolve the issue.

I also may give a take-home test that is pretty basic (I think so, I might have to re-evaluate it because a lot of candidates can't seem to do it). This is more of a test to see how well you follow a spec, and more for seeing what your code/organization looks like than a true test of your coding ability.


It depends on what is meant by "entry". It could very all the way from just a CS degree is enough and they will ask algo/datastructures, all the way to asking you to implement some an iOS class and the only thing entry-level is the pay.
With that said, here is what to focus on in the interview.
Go with what you know, often times the interviewer doesn't expect you to know everything, they just want to see what you already know. If you are asked something like tell me about viewControllers guide me through them, just describe all of the methods that are within the VC, when are they called. Its entry level, I expect that they won't expect you to know the view draw/re-draw cycle. If you really dont know explain to the interviewer what you would do to find the answer, just don't claim to know the answer. Its ok to also mention you've never worked with a concept, especially certain ubiquitous classes like NSUserDefaults.
DONT PANIC!!!!! If you are asked a tough question, its tough for everyone. The key thing here is to understand how you think and go through a problem. Let me let you in on a secret, I can't solve an algo problem in 30 seconds, it takes me at least 15 minutes for a simple one, and longer for a harder one. If you are asked one take these steps. 1st minute: repeat the question and make sure you fully understand the question being asked. 2. Write out psudo code and explain that you will first write out the psudo code, than you will code. 3. Code the solution as best as you can. 4. If you aren't getting close to a solution change courses, I've seen too many people stick with the wrong solution and I've even seen one candidate argue with me explaining why their incorrect solution was flawless.
clarify, clarify, clarify. If you are asked a question which you dont fully understand ask some questions about it. If you still dont understand start making assumptions but list those assumptions and talk them out, there isn't anything wrong with assumptions so long as you mention to the interviewer what they are.


Interview questions in iOS revolve around three key themes. Memory management, thread safety/multi-threading, and views.

1. What is the difference between Non-atomic and atomic? A: This is about thread safety. Atomic means that if the object is being muted there is a guarantee that the system will wait before returning the object. Non-atomic makes no such guarantees.

1A. Does Atomic guarantee thread safety A: Short Answer: NO, use NSLock or NSRecursiveLock if you need thread safety.

Long Answer: Depends, if its a simple variable, like 1 variable than yes, atomic is fine. If there are multiple values or settings that can be changed or if caching is involved, than no use NSLock or NSRecursiveLock classes. You can use dispatch_semaphore_t to limit the number of objects that could modify your objects.

Further Reading:

Thread Safety Guide From Apple

https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Multithreading/ThreadSafety/ThreadSafety.html

https://www.objc.io/issues/2-concurrency/thread-safe-class-design/
https://www.mikeash.com/pyblog/friday-qa-2015-02-06-locks-thread-safety-and-swift.html
https://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1
https://www.raywenderlich.com/79150/grand-central-dispatch-tutorial-swift-part-2


2. Memory Management in Objective-C. A. Objective-C uses ARC. Know what all the properties do. Strong vs. Weak is key here. Also understand what goes onto the heap, and what goes onto the stack. Understand what the copy command does. The big gotchas here are creating retain cycles, and accessing zombie objects.

3.Blocks (biggest gotcha here, many candidates I've seen fail here) A. Understand the 3 caveats. What are they? Check them out here. At its core, this is relating to when to use self, __weak self, and __strong self when it comes to blocks. Also understand why blocks require the (copy) property. This goes back to question number 2

4. Tell me about Views. A. Views in Objective C. Understand how a view is drawn on the screen. A view's animation is cached or is in memory if its from the UIKit, otherwise the view is rendered than cached and is redrawn as few times as possible.
Further Reading: View Programming Guide From Apple

4A. What is the difference between the Frame and the Bounds. A. *Frame is how the view relates to the superView. Its more about the superview knowing how big a view is, and is related to where the view lies within the superviews coordinate grid.

*Bounds is the drawable area inside the view itself. Think of this as the view's coordinate system.

4B. Does the UITableViewController draw all of the tableViewCells? A. No, it draws as many as it can fit on the screen. The indexPath for CellForRowAtIndexPath and the tableViewCell's related position information are not the same. In some cases, the UI elements can have bugs because of this fact.
Further Reading: Table View Programming Guide From Apple


I interview iOS people, I usually also ask:
Explain the entire provisioning process and how each of the pieces relate (Device ID list, provisioning profile, certificate, and App IDs)
If you perform an IO/Network/etc call and you can't tap on a button while it's processing, what is the issue and how do you fix it?
How do you manage your dependencies? (Cocoapods)
What is the latest version of Xcode? (SO MANY PEOPLE GET TRIPPED UP BY THIS. Any competent developer will know the version# off hand)
How do you configure a singleton? (dispatch_once is the only acceptable answer)

I don't like to ask these kinds of questions during interviews - I much prefer to ask about previous experience and to use that as a jumping off point for a discussion about APIs, technical challenges the candidate has faced, etc. Unfortunately over the last few years I've seen so many candidates that were lacking in the fundamentals for Cocoa development that I've resorted to getting these questions out of the way to save time. Sometimes these are part of a pre-screen, sometimes part of the in-person interview. A good candidate will get through these pretty quickly. The not so good ones don't make it past two or three of them, and there doesn't seem to be much middle ground.
Explain frame vs. bounds
This is by far the most common interview question. http://macoscope.com/blog/understanding-frame/
Give an example of a correct use of autorelease.
When relinquishing ownership of an object that should not be released immediately - i.e. when returning an object from a method and relinquishing ownership to the caller. It's very common to get this wrong. Every interview will have memory management/ownership questions, and you should expect to be able to explain at least some of how ARC works.
Give an example of incorrect use.
This would be a long list, but it's very common to get this wrong.
Explain how a table view works (or cell reuse, etc).
https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/TableView_iPhone/AboutTableViewsiPhone/AboutTableViewsiPhone.html
What is the role of a view controller?
Managing a screen of content. https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/ControllerObject.html#//apple_ref/doc/uid/TP40008195-CH11-SW3
Whiteboard model-view-controller as it applies to Cocoa.
You seem some really interesting answers to this. Usually a classic MVC diagram... and they can't figure out where a view controller goes, or what a model object would be.
Explain target-action
https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Target-Action/Target-Action.html#//apple_ref/doc/uid/TP40010810-CH12-SW1
What is a class cluster?
https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/ClassCluster.html#//apple_ref/doc/uid/TP40008195-CH7-SW1
How would you get JSON data from a web service?
Acceptable answers would use NSURLConnection or NSURLSession and NSJSONSerialization.
How would you calculate the number of hours between two NSDates and present the result to the user?
Hint: Use NSCalendar correctly.
What is the difference between GCD or NSOperation and threads?
Queues vs. threads, different level of abstraction, yadda yadda.
What makes calling from C code to Objective-C objects difficult?
Calling C from Objective-C is easy. Going the other way is a bit more involved. Explain why.
What is toll free bridging?
https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Toll-FreeBridgin/Toll-FreeBridgin.html#//apple_ref/doc/uid/TP40010810-CH2-SW1
What is a formal protocol? An informal protocol?
Contrary to this document, an informal protocol is not necessarily on NSObject: https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/Protocol.html#//apple_ref/doc/uid/TP40008195-CH45-SW1
What is fast enumeration?
https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/Enumeration.html#//apple_ref/doc/uid/TP40008195-CH17-SW3
How would you test an asynchronous method/object?
You get some interesting answers to this, even today with Xcode 6 and the new capabilities of XCTest.
What is a designated initializer?
https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/Initialization.html#//apple_ref/doc/uid/TP40008195-CH21-SW1
What is forward invocation?
https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtForwarding.html
What would you use NSProxy for?
Most people don't seem to know it exists, and don't get this far. :( NSProxy is useful for a lot of things, though there are some things it can't do (anything that involves an informal protocol on NSObject or it's descendants can be.... challenging, like KVC). Apple frameworks use NSProxy and forward invocation quite a bit.
Missing these questions is not necessarily a bad thing.
Usually that turns into a discussion, and one of the things I'm looking for is how the candidate assimilates and internalizes new information. For example, I may have to explain the correct use of autorelease, and may walk the candidate through how autorelease works and why. He should then be able to give me a good example of incorrect use of autorelease. More than a few times I've pulled up the source or documentation for something in Foundation and walked through it to see how well a candidate can learn it.
Other general questions:
What is your OOP programming style: breadth or depth? They are asking if you create a lot of small objects (mostly derived from NSObject) or a lot of base classes that derived from other base classes.
Do you use version control and if so which ones? Explain how you use version control.
Have you used JSON, XML, REST, etc? Which libraries have you used if any?
What third party libraries are you familiar with?
Do you have a blog? Do you have a Stack Overflow account where you have asked and / or answered questions?
Explain when you would use some off the common collections. They are asking about NSArray, NSDictionary, etc. You would need to have reasons why you would use one over the other and when you would use the Mutable version.
When to use statics, singletons, static initialization. Why would you want to avoid using any of those.
@property vs. member variable.
Storyboards vs. NIBs vs. programmatically creating the UI.
What is a segue? When would you use one?
permalinksavegive gold
