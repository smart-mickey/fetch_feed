Getting Started with AFNetworking

This is a guide to help developers get up to speed with AFNetworking. It is geared primarily towards anyone who is new to Mac or iOS development, or has not worked extensively with 3rd-party libraries before.

These step-by-step instructions are written for Xcode 5, using the iOS 7 SDK. If you are using a previous version of Xcode, you may want to update before starting.

Step 1: Download CocoaPods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects.

CocoaPods is distributed as a ruby gem, and is installed by running the following commands in Terminal.app:

$ sudo gem install cocoapods
$ pod setup
Depending on your Ruby installation, you may not have to run as sudo to install the cocoapods gem.

Step 2: Create a Podfile

Project dependencies to be managed by CocoaPods are specified in a file called Podfile. Create this file in the same directory as your Xcode project (.xcodeproj) file:

$ touch Podfile
$ open -a Xcode Podfile
You just created the pod file and opened it using Xcode! Ready to add some content to the empty pod file?

Copy and paste the following lines into the Xcode window:

target "MyTargetName" do
    source 'https://github.com/CocoaPods/Specs.git'
    platform :ios, '7.0'
    pod 'AFNetworking', '~> 2.5'
end
You shouldn’t use TextEdit to edit the pod file because TextEdit likes to replace standard quotes with more graphically appealing quotes. This can cause CocoaPods to get confused and display errors, so it’s best to just use Xcode or another programming text editor.

Step 3: Install Dependencies

Now you can install the dependencies in your project:

$ pod install
From now on, be sure to always open the generated Xcode workspace (.xcworkspace) instead of the project file when building your project:

$ open <YourProjectName>.xcworkspace
Step 4: Dive In!

At this point, everything's in place for you to start using AFNetworking. Just #import the headers for the classes you need and get to it!

Next Steps

You can find even more articles like this one on the wiki. You'll also want to keep a link to the documentation handy while you're working on your app.
