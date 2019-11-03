# RotatableStack

A SwiftUI view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation. It wraps your content in a `GeometryReader` to determine if the device is in landscape or portrait rotation (or on larger devices, if it's generally wider or narrower). If portrait, it wraps the content in a `VStack`, else it wraps in an `HStack` for landscape. 

## Basic Usage
Use `RotatableStack` in place of a `VStack` or `HStack` where you want the layout to change based on the geometry of your devce:

```swift
struct MyView: View {

    var body: some View {
        RotatableStack {
            Spacer()
            Text("Hello, World!")
    }
}
```
