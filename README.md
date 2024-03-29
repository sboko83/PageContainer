# PageContainer
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

_PageContainer_ implements a simple way to display AlertView, ActionSheetView, etc.<br />
The page container is located at the topmost level of the view. No need to create state variables and stuff. The display is performed by calling the ViewModel methods. This is convenient when you have a lot of screens in your application, as well as when you need the view to look non-standard.<br />
The output views can be modified using _PageContainerConfig_ (singleton). You can change the background color, text color, buttons, frames, rounding radius, and so on.<br />

LoadingView locks the screen and displays information in the center of the screen about what is loading.<br />
AlertView displays information in the center of the screen: an icon, a title, text and an OK button.<br />
Action Sheet View displays in the center of the screen: title, body (other view, optional) and an array of buttons.<br />
Bottom Buttons View displays at the bottom of the screen: the title (optional) and an array of buttons.<br />

[README на русском языке](https://github.com/sboko83/PageContainer/blob/main/README_ru.md)


## Requirements
* iOS 14.0+


## Installation

**Swift Package Manager**

In Xcode:<br />
* File - Swift Packages - Add Package Dependency...
* Use the URL https://github.com/sboko83/PageContainer

**Manual installation**

The project has no external dependencies.<br />
If you need to add a PageContainer to another project, you need to copy the _PageContainer_ folder to your project with the options "Copy items is needed" and "Create groups".<br />


## Examples

**Common**
Before using it, you need to import the module.<br />
You need to create a ViewModel and inherit it from _PageContainerViewModel_.<br />
In the root View, which is responsible for the entire screen, we add the ViewModel and the _PageContainer_ call.<br />
```Swift
import PageContainer

class TestViewModel: PageContainerViewModel {
} 
```
```Swift
import PageContainer

struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            // <- Here is your content
        }
    }
}
```

**LoadingView example**
```Swift
import PageContainer

class TestViewModel: PageContainerViewModel {
    func loadSomeData() {
        showLoading() // showing LoadingView
        networking.request { result in
            // data processing here
            self.hideLoading() // hiding LoadingView
        }
    }
}
```
```Swift
import PageContainer

struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            Button(action: { viewModel.loadSomeData() }) {
                Text("Load data")
            }
        }
    }
}
```

**AlertView example**
```Swift
import PageContainer

class TestViewModel: PageContainerViewModel {
    func outputUserInfo() {
        // possible actions and/or conditions
        showMessage(message: "User information") {
            // actions after closing AlertView
        }
    }
}
```
```Swift
import PageContainer

struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            Button(action: { viewModel.outputUserInfo() }) {
                Text("Show user info")
            }
        }
    }
}
```

All usage examples are here: [Demo folder](https://github.com/sboko83/PageContainer/tree/main/Demo)


## Change log

**0.4.2**
- The creation of the ActionSheetView is completely removed from the model into the main View.
Changes in the Demo project:
- Changes in the project structure.
- Redesigned the display of ActionSheetView and BottomButtonsView.
- PageContainer is no longer a dependency of SPM, but a link to a folder.

**0.4.1**
- PageContainerConfig refactoring.
- Added setLightStyle method to PageContainerConfig.
- Some demo updates.

**0.4**
- Added the ability to display Custom View.
- Refactoring.
- Editing documentation in Russian and English.
- Demo project added.

**0.3**
- The AlertView icon has been redesigned, now you can set it yourself.
