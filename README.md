# RotatableStack

- [RotatableStack](#rotatablestack)
  - [Basic Usage](#basic-usage)
  - [Alignment and Spacing](#alignment-and-spacing)

A SwiftUI view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation. It wraps your content in a `GeometryReader` to determine if the device is in landscape or portrait rotation (or on larger devices, if it's generally wider or narrower). If portrait, it wraps the content in a `VStack`, else it wraps in an `HStack` for landscape. 

## Basic Usage
Use `RotatableStack` in place of a `VStack` or `HStack` where you want the layout to change based on the geometry of your device:

```swift
struct MyView: View {

    var body: some View {
        RotatableStack {
            Spacer()
            Text("Hello, World!")
        }
    }
}
```
## Alignment and Spacing
You can also pass parameters down to the underlying `VStack` or `HStack`, including alignment and spacing.

```swift
struct MyView: View {

    var body: some View {
        RotatableStack(
            horizontalAlignment: .leading,
            verticalAlignment: .top,
            spacing: 16
        ) {
            Spacer()
            Text("Hello, World!")
        }
    }
}
```

Parameter | Type | Default | Notes
---- | ---- | ---- | ----
`horizontalAlignment` | `HorizontalAlignment` | `.center` | Horizontal alignment passed to underlying `VStack` when alignment is portrait.
`verticalAlignment` | `VerticalAlignment` | `.center` | Vertical alignment passed to underlying `HStack` when alignment is landscape.
`spacing` | `CGFloat?` | `nil` | Spacing to pass to the underlying `VStack` or `HStack`.

You pass both alignment types since one will be used for portrait and the other for landscape.

If you want to make this a bit easier, this package provides a `FlexAlignment` enum that works almost exactly the same as `HorizontalAlignment`, but will work in both orientations. In landscape, the top is "leading" and the bottom is "trailing". This is just a shortcut if you want to keep alignment consistent in either orientation.

```swift
struct MyView: View {

    var body: some View {
        RotatableStack(
            alignment: .leading,
            spacing: 16
        ) {
            Spacer()
            Text("Hello, World!")
        }
    }
}
```

Parameter | Type | Default | Notes
---- | ---- | ---- | ----
`alignment` | `FlexAlignment` | NA | A universal alignment that is translated/passed to underlying `VStack` when alignment is portrait or `HStack` when alignment is landscape.
`spacing` | `CGFloat?` | `nil` | Spacing to pass to the underlying `VStack` or `HStack`.

Thanks to [kcochibili](https://github.com/kcochibili) for suggesting the addition of alignment and spacing!