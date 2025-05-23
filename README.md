# SwipeActions

[![Latest release](https://img.shields.io/github/v/release/c-villain/SwipeActions?color=brightgreen&label=version)](https://github.com/c-villain/SwipeActions/releases/latest)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FSwipeActions%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/c-villain/SwipeActions)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FSwipeActions%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/c-villain/SwipeActions)
[![](https://img.shields.io/badge/SPM-supported-DE5C43.svg?color=brightgreen)](https://swift.org/package-manager/)
![](https://img.shields.io/github/license/c-villain/SwipeActions)

[![contact: @lexkraev](https://img.shields.io/badge/contact-%40lexkraev-blue.svg?style=flat)](https://t.me/lexkraev)
[![Telegram Group](https://img.shields.io/endpoint?color=neon&style=flat-square&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2Fswiftui_dev)](https://telegram.dog/swiftui_dev)

<p align="left">
<img src="Sources/Gifs/teaser.jpg" alt="corner radius" width="600">
</p>

Library for creating fully customizable swipe actions for any SwiftUI View, similar to Apple's [```swipeActions(edge:allowsFullSwipe:content:)```](https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:)) that available from iOS 15 and only in [List](https://developer.apple.com/documentation/swiftui/lists) 🤷🏼‍♂️.
You can use ```SwipeActions``` in project targeting iOS 13 with any view (e.g. ```Text``` or ```VStack```).

👨🏻‍💻 Feel free to subscribe to channel **[SwiftUI dev](https://t.me/swiftui_dev)** in telegram.

## Requirements

- iOS 13.0 or macOS 10.15

## Comparison table

| Features support | This SPM | Others |
| :---         |     :---:      |          :---:  |
| SwiftUI   | 🟢     | 🟢     |
| SPM    | 🟢        | 🟢       |
| MacOS    | 🟢        | 🔴       |
| iOS 13.0    | 🟢        | 🔴       |
| RTL Languages    | 🟢        | 🔴       |
| FullSwipe Mode   | 🟢        | 🔴       |
| Flexibility   | 🟢        | 🟡       |
| Haptics   | 🟢        | 🟡       |
| Ease of Use    | 🟢        | 🔴       | 


## Installation

#### Swift Package Manager

To integrate ```SwipeActions``` into your project using SwiftPM add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/c-villain/SwipeActions", from: "0.1.0"),
],
```
or via [XcodeGen](https://github.com/yonaskolb/XcodeGen) insert into your `project.yml`:

```yaml
name: YourProjectName
options:
  deploymentTarget:
    iOS: 13.0
packages:
  SwipeActions:
    url: https://github.com/c-villain/SwipeActions
    from: 0.1.0
targets:
  YourTarget:
    type: application
    ...
    dependencies:
       - package: SwipeActions
```

## Types

Different types of menu: 
- .swiped
- .slided

<p align="center">
<img src="Sources/Gifs/menuTypes.gif" alt="Example for .swiped and .slided menu" height="100" width="280">
</p>

Both types can be upgraded with full swiping:

<p align="center">
<img src="Sources/Gifs/fullSwipe.gif" alt="Example of full swipe with non-destructive role" width="280">
</p> 

## Quick start

<details>
  <summary>Adding both leading and trailing swipe actions:</summary>

<p align="center">
<img src="Sources/Gifs/both.gif" alt="Example with leading and trailing swipes" height="160" width="280">
</p>

Use ```Leading { ... }``` and ```Trailing { ... }``` closures inside ```.addSwipeAction { ... }``` modifier:

```swift
import SwipeActions

struct YourView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { cell in
                    Text("Cell \(cell)")
                        .frame(height: 50, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .addSwipeAction {
                            Leading { //<= HERE 
                                Button {
                                    print("edit \(cell)")
                                } label: {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 60, height: 50, alignment: .center)
                                .contentShape(Rectangle())
                                .background(Color.green)

                            }
                            Trailing { //<= HERE 
                                HStack(spacing: 0) {
                                    Button {
                                        print("remove \(cell)")
                                    } label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 60, height: 50, alignment: .center)
                                    .contentShape(Rectangle())
                                    .background(Color.red)
    
                                    Button {
                                        print("Inform \(cell)")
                                    } label: {
                                        Image(systemName: "bell.slash.fill")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 60, height: 50, alignment: .center)
                                    .background(Color.blue)
                                }
                            }
                        }
                }
            }
        }
    }
}
```

</details>

<details>
  <summary>Adding several actions on the side:</summary>

Don't forget that your actions are subviews in general and buttons or smth else particularly. Please arrange them:

```swift
YourView()
.addSwipeAction(edge: .trailing) {
    HStack(spacing: 0) { // <= 👀 Look here 
        Rectangle()
            .fill(Color.green.opacity(0.8))
            .frame(width: 8.0, height: 80)
        
        Button {
        } label: {
            Image(systemName: "message")
                .foregroundColor(.white)
                .frame(width: 60, height: 80)
                .contentShape(Rectangle())
        }
        .background(Color.blue)
    }
}

```

</details>


<details>
  <summary>Adding swipe actions to the one side of the view:</summary>

<p align="center">
<img src="Sources/Gifs/trailing.gif" alt="Example with trailing swipe menu" height="160" width="280">
</p>

Use ```.addSwipeAction(edge: ) { ... }``` modifier, ```edge``` - a ```HorizontalAlignment``` value input parameter - with two cases of using ```.leading``` or ```.trailing```

```swift
import SwipeActions

struct YourView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { cell in
                    Text("Cell \(cell)")
                        .frame(height: 50, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .addSwipeAction(edge: .trailing) { // <= choose here .trailing or .leading
                            HStack(spacing: 0) {
                                Button {
                                    print("remove \(cell)")
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 60, height: 50, alignment: .center)
                                .contentShape(Rectangle())
                                .background(Color.red)
                                
                                Button {
                                    print("Inform \(cell)")
                                } label: {
                                    Image(systemName: "bell.slash.fill")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 60, height: 50, alignment: .center)
                                .background(Color.blue)
                            }
                        }
                }
            }
        }
    }
}
```

</details>

<details>
  <summary>For automatically closing other opened actions during sliding: </summary>
  
<p align="center">
<img src="Sources/Gifs/autoclosing.gif" alt="Example with auto closing swipe actions" width="280">
</p> 
  
  Add ```SwipeState``` var to your ```View``` and pass it as a ```binding``` in ```.addSwipeAction(state:)```:
  
  ```swift
  
struct YourView: View {  
     @State var state: SwipeState = .untouched // <= HERE

     var body: some View {
          ScrollView {
               VStack(spacing: 2) {
                   ForEach(1 ... 30, id: \.self) { cell in
                       Text("Cell \(cell)")
                           .addSwipeAction(state: $state) { // <= HERE
                              ....
                           }
                    }
               }
          }
     }
}
```
  
 </details>
 
### Full swipe action
  
  For full swipe use modifier ```.addFullSwipeAction(menu:swipeColor:swipeRole:state:content:action:)```
  
  Basically there are two main ```SwipeRole``` for full swipe action: ```.destructive``` (defaults) and other one.
  
  <details>
  <summary>.destructive</summary>
  
  This role is used for closing/hiding/removing cell.
  
  
<p align="center">
<img src="Sources/Gifs/destructiveFullSwipe.gif" alt="Example of full swipe with destructive role" width="280">
</p> 
     
  
  ```swift
  
struct YourView: View {  
     
     @State var range: [Int] = [1,2,3,4,5,6,7,8,9,10]

     var body: some View {
          ScrollView {
               VStack(spacing: 2) {
                   ForEach(range, id: \.self) { cell in
                       Text("Cell \(cell)")
                           .addFullSwipeAction(
                               menu: .slided,
                               swipeColor: .red) { // <= Color is the same as last button in Trailing for full effect 
                                    Leading { 
                                        ...
                                    }
                                    Trailing {
                                        ...
                                        
                                        Button {
                                            withAnimation { 
                                                if let index = range.firstIndex(of: cell) {
                                                    range.remove(at: index)
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "trash")
                                                .foregroundColor(.white)
                                        }
                                        .contentShape(Rectangle())
                                        .frame(width: 60)
                                        .frame(maxHeight: .infinity)
                                        .background(Color.red) // <=== Look here
                                    }
                                } action: { // <= action for full swiping
                                    withAnimation {
                                        if let index = range.firstIndex(of: cell) {
                                            range.remove(at: index)
                                        }
                                    }
                                }
                    }
               }
          }
     }
}
```
   </details>
   
   
  <details>
  <summary>.default</summary>
  
  This role is used for making some action on cell.
  
<p align="center">
<img src="Sources/Gifs/nondestructiveFullSwipe.gif" alt="Example of full swipe with non-destructive role" width="280">
</p> 
     
  
  ```swift
  
struct YourView: View {  ]

     var body: some View {
          ScrollView {
               VStack(spacing: 2) {
                   ForEach(1...10, id: \.self) { cell in
                       Text("Cell \(cell)")
                           .addFullSwipeAction(menu: .slided,
                                               swipeColor: .green, // <=== Color is the same as last button in Trailing for full effect 
                                               swipeRole: .defaults) {  // <=== Add this parameter
                                    Leading { 
                                        ...
                                    }
                                    Trailing {
                                        HStack(spacing: 0) {
                                            ...
                                            
                                            Button {
            
                                            } label: {
                                                Image(systemName: "trash")
                                                    .foregroundColor(.white)
                                            }
                                            .contentShape(Rectangle())
                                            .frame(width: 60)
                                            .frame(maxHeight: .infinity)
                                            .background(Color.green) // <=== Look here
                                        }
                                    }
                                } action: { // <=== action for full swiping
                                    ...
                                }
                    }
               }
          }
     }
}
```
   </details>
 
### Recommendations for use

<details>
  <summary>With dynamic height content.</summary>
 
 
use ```.frame(maxHeight: .infinity)```

```swift
YourView()
    .addSwipeAction(menu: .slided, edge: .trailing) {
        Button {
            ...
        } label: {
            Image("trash")
                .font(.system(size: 20.0))
                .foregroundColor(.white)
                .frame(width: 68, alignment: .center)
                .frame(maxHeight: .infinity) // <= Look here
                .background(.red)
        }
    }
```

</details>

<details>
  <summary>With transparent colored views.</summary>
 
 There is *no* restrictions or any recommendations for using with ```.slided``` type! 
 
 With ```.swiped``` use *non-tranparent* color layer or the same color with ```alfa = 1.0```:

```swift
ForEach(1 ... 30, id: \.self) { cell in
   Text("Cell \(cell)")
       .padding()
       .frame(height: 80)
       .frame(maxWidth: .infinity)
       //.background(Color.green.opacity(0.2)) // <== ❌ DON'T USE SUCH WAY!
       //.background(Color(red: 0.841, green: 0.956, blue: 0.868)) // <== ✅ USE THIS WAY!
       .background( // <== OR THIS WAY!
           ZStack {
               Color(UIColor.systemBackground) // non-transparent color layer
               Color.green.opacity(0.2)
           }
       )
       .contentShape(Rectangle())
       .listStyle(.plain)
       .addSwipeAction(menu: .swiped, // <=== SWIPED TYPE
                       state: $state) {
           Leading {
           ...
           }
       }
       ...
 }
```
</details>

<details>
  <summary>With List.</summary>

Basically if you have minimum deployments target for your app is iOS 15 I recommend to use Apple's [swipe actions](https://developer.apple.com/documentation/swiftui/view/swipeactions(edge:allowsfullswipe:content:)) for List. Anyway you may use this.

Due to some features for working with ```List``` you should:

 - specify a frame for cell width, e.g. ```.frame(width: UIScreen.main.bounds.size.width - 32, height: 80)``` and a frame for buttons on swipe actions, e.g. ```.frame(width: 60, height: 80)```. Note that height in frames should be the same!
 
 - add modifier ```.onTapGesture { ... }``` for cell to override tapping on swipe action buttons
 
 - add modifier ```.listRowInsets(EdgeInsets())``` for cell
 
```swift
List(elements) { e in
    Text(e.name)
        .frame(width: UIScreen.main.bounds.size.width - 32, height: 80) // <= HERE
        .background(Color(UIColor.systemBackground))
        .onTapGesture { // <=== HERE
            print("on cell tap!")
        }
        .addSwipeAction(menu: .swiped,
                        edge: .trailing,
                        state: $state) {
            Button {
                print("remove")
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 80, alignment: .center) // <= HERE
            .contentShape(Rectangle())
            .background(Color.red)
        }
                        .listRowInsets(EdgeInsets()) // <=== HERE
}
.padding(16)
```

Look for code in the example.

</details>

<details>
  <summary>With no horizontal padding views.</summary>

To avoid effect when content in swipe actions started showing immediately after view with no horizontal padding

<p align="center">
<img src="Sources/Gifs/demoWithoutInsets.gif" alt="Demo without insets" width="280">
</p>

in ```.addSwipeAction { ... }``` add ```Rectangle``` filled with *same* color as root view:

<p align="center">
<img src="Sources/Gifs/demoWithInsets.gif" alt="Demo with insets" width="280">
</p>

```swift
 YourView()
     .frame(height: 80)
     .frame(maxWidth: .infinity)
     .background(Color.green.opacity(0.8)) // <= Look here
     .addSwipeAction(edge: .trailing) {
        HStack(spacing: 0) {
             Rectangle() // <=== HERE!
                 .fill(Color.green.opacity(0.8)) // <= 💡 Don't forget!
                 .frame(width: 8.0, height: 80)
    
             Button {
             } label: {
                 Image(systemName: "message")
                     .foregroundColor(.white)
             }
             .frame(width: 60, height: 80)
             .contentShape(Rectangle())
             .background(Color.blue)
        }
     }
```

</details>

<details>
  <summary>With context menu.</summary>

<p align="center">
<img src="Sources/Gifs/withContextMenuDemo.gif" alt="Demo without insets" width="280">
</p>

Due to some difficulties for SwiftUI to detect gestures for sliding view and opening context menu I recommend you to use
`.contextMenu` after `.addSwipeAction` (or `addFullSwipeAction`):

```swift
 YourView()
     .frame(height: 80)
     .frame(maxWidth: .infinity)
    .contentShape(Rectangle()) 
    .padding()
    .background(Color(UIColor.systemBackground))
    .addFullSwipeAction(...) { ... }  // <=== Look here!
    .contextMenu { ... }
```

Actually if you don't use `.contentShape(Rectangle())`, you can also add `.contextMenu` before `.addSwipeAction` (or `addFullSwipeAction`):

```swift
 YourView()
     .frame(height: 80)
     .frame(maxWidth: .infinity)
    //.contentShape(Rectangle()) // <=== Look here!
    .padding()
    .contextMenu { ... } // <=== Look here!
    .background(Color(UIColor.systemBackground))
    .addFullSwipeAction(...) { ... } // <=== Look here!
```

</details>

<details>
  <summary>How to add swipe hint.</summary>

Use modifier `.swipeHint`:

The place for applying this modifier depends on type of menu.

Add `.swipeHint` strictly after `.addSwipeAction` for `.slided` type of menu 👇🏻
```swift
ForEach(range, ...) {
    YourCell()
        ...
        .addFullSwipeAction(
            menu: .slided, // <== LOOK HERE
            swipeColor: .red,
            state: $state) {
                Leading {
                    ...
                }
                Trailing {
                    ...
                }
            }
        .swipeHint(cell == range.first, hintOffset: 120.0) // for trailing <== LOOK HERE
        .swipeHint(cell == range[1] , hintOffset: -120.0) // for leading <== LOOK HERE
    ...
}
```

Add `.swipeHint` strictly before `.addSwipeAction` for `.swiped` type of menu 👇🏻
```swift
ForEach(range, ...) {
    YourCell()
        ...
        .swipeHint(cell == range.first, hintOffset: 120.0) // for trailing <== LOOK HERE
        .swipeHint(cell == range[1], hintOffset: -120.0) // for leading <== LOOK HERE
        .addFullSwipeAction(
            menu: .swiped, // <== Look here
            swipeColor: .red,
            state: $state) {
                Leading {
                    ...
                }
                Trailing {
                    ...
                }
            }
    ...
}
```

</details>


<details>
    <summary>Multitouching.</summary>

Due to SwiftUI philosophy is not quite possible to control multitouching in general and dragging several cells particularly. Anyway we can disable multitouch with special view modifier: `.allowMultitouching(false)` based on UIKit. Add this modifier strictly before using swipe actions:

```swift
...
YourView(...)
      .allowMultitouching(false) // <= Look here
      .addSwipeAction( ...) {
        ...
      }
...
```
By default this flag is true. Using this modifier will repeat telegram's behaviour where you can drag only one cell during multitouching. 

Actually the problem exist only in fullswiping mode. In default mode you can drag several cells but after ending touching only one will be opened.

But as soon as this solution is based on UIKit you can't optimise rendering of `YourView` with `drawingGroup()`:
```swift
...
YourView(...)
      .allowMultitouching(false) // <= look here
      .addSwipeAction( ...) {
        ...
      }
      .drawingGroup() // <=  ❌ DON'T DO THAT
...
```

You'll definitely get this:

<img width="338" alt="Drawing group after swipeactions" src="https://github.com/user-attachments/assets/b8671c69-a5e1-4ca7-8d62-67b68bd2d33f">

Actually rendering will be optimizing by SwiftUI engine... For full control you can add view modifier `.identifier(your id)` to `YourView(...)`
</details>

<details>
    <summary>Optimize rendering.</summary>

To control view's id for optimizing you should use modifier `.identifier(your id)`:

```swift
ForEach(...) { cell in
     YourView(cell)
         .addSwipeAction(...) {}
         .identifier(cell) // <= Look here
 }
```

Actually if you forget to add identifier this don't worry, id will be added manually.

</details>

<details>
    <summary>Swipe sensitivity.</summary>

To control swipe sensitivity (minimum distance for dragging) you should use modifier `swipeSensitive`.

```swift
ForEach(...) { cell in
     YourView(cell)
         .addSwipeAction(...) {}
         .swipeSensitive(.medium) // <= Look here. You can control it here 
 }
 .swipeSensitive(.medium) // <= Look here. Or here! 
```

If you forget to add sensitivity, don't worry the system will provide its own default `low` value. Actually it is the most comfortable behavior.

</details>


### Supporting Right to left

This Library supports right-to-left languages like Arabic and Hebrew. 

Check it by adding `.environment(\.layoutDirection, .rightToLeft)` to your view with swipe actions.

<details>
<summary>Look for the example</summary>

```swift
struct ContentView: View {
    var body: some View {
        LazyVStack {
            ForEach(0..<5) { index in
                Text("Item \(index)")
                    .swipeActions {
                        Button("Delete") {
                            print("Item deleted")
                        }
                        .tint(.red)
                    }
            }
        }
        .environment(\.layoutDirection, .rightToLeft) // <= Look here
    }
}
```

</details>

### Haptics Supporting 

By default in the full swiping mode action has haptic feedback.

To disable it use `.allowFullSwipeHaptics(false)`

<details>
<summary>Look for the example</summary>

```swift
YourView()
    .addFullSwipeAction(...) { ... }
    .allowFullSwipeHaptics(false) // <= Look here
```

</details>

You can easily change this feedback type with `.fullSwipeHapticFeedback(:)`.

<details>
<summary>Look for the example</summary>

```swift
YourView()
    .addFullSwipeAction(...) { ... }
    .fullSwipeHapticFeedback(.medium()) // <= Look here
```

</details>

You can easily add haptic to your own buttons in swipe actions.

<details>
<summary>Look for the example</summary>

```swift
YourView()
    .addFullSwipeAction(...) { 
        ... 
    Trailing {
        Button {
            HapticsProvider.sendHapticFeedback(.heavy()) // <= Look here
                ...
            } label: { ... }
     }
}
```

</details>

## Communication

- If you **found a bug**, open an issue or submit a fix via a pull request.
- If you **have a feature request**, open an issue or submit a implementation via a pull request or hit me up on **lexkraev@gmail.com** or **[telegram](https://t.me/lexkraev)**.
- If you **want to contribute**, submit a pull request onto the master branch.

## License

SwipeActions package is released under an MIT license.

## Special thanks

Thx to [Prafulla Singh](https://prafullkumar77.medium.com/) for inspriration with his [SwiftUI tutorial](https://prafullkumar77.medium.com/swiftui-how-to-make-custom-swipe-able-cell-727a27abdddd).
