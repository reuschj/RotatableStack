//
//  RotatableStack.swift
//
//  Created by Justin Reusch on 10/26/19.
//  Copyright © 2022 Justin Reusch. All rights reserved.
//

import SwiftUI

/// A SwiftUI view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation
@available(iOS 13.0, *)
@available(OSX 10.15, *)
@available(watchOS 6.0, *)
public struct RotatableStack<Content>: View where Content: View {

    /// Horizontal alignment passed to underlying `VStack` when alignment is portrait
    public var horizontalAlignment: HorizontalAlignment = .center

    /// Vertical alignment passed to underlying `HStack` when alignment is landscape
    public var verticalAlignment: VerticalAlignment = .center

    /// Spacing to pass to the underlying `VStack` or `HStack`
    public var spacing: CGFloat?

    /// Stores the content function builder
    public var content: () -> Content

    /// A SwiftUI view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation
    ///
    /// - Parameters:
    ///   - horizontalAlignment: Horizontal alignment passed to underlying `VStack` when alignment is portrait
    ///   - verticalAlignment: Vertical alignment passed to underlying `HStack` when alignment is landscape
    ///   - spacing: Spacing to pass to the underlying `VStack` or `HStack`
    ///   - content: The view builder content to pass
    @inlinable public init(
        horizontalAlignment: HorizontalAlignment = .center,
        verticalAlignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    /// A SwiftUI view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation
    ///
    /// - Parameters:
    ///   - alignment: A universal alignment that is translated/passed to 
    ///     underlying `VStack` when alignment is portrait or `HStack` when alignment is landscape.
    ///   - spacing: Spacing to pass to the underlying `VStack` or `HStack`
    ///   - content: The view builder content to pass
    @inlinable public init(
        alignment: FlexAlignment,
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            horizontalAlignment: alignment.horizontalAlignment,
            verticalAlignment: alignment.verticalAlignment,
            spacing: spacing,
            content: content
        )
    }

    /**
     Gets the orientation (portrait or landscape) based on the current geometry
     - Parameters:
     - geometry: The geometry obtained from the `GeometryReader`
     */
    private func getOrientation(from geometry: GeometryProxy) -> Orientation {
        geometry.size.width > geometry.size.height ? .landscape : .portrait
    }

    public var body: some View {
        GeometryReader { geometry in
            if getOrientation(from: geometry) == .portrait {
                VStack(
                    alignment: horizontalAlignment,
                    spacing: spacing,
                    content: content
                )
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height,
                    alignment: .center
                )
            } else {
                HStack(
                    alignment: verticalAlignment,
                    spacing: spacing,
                    content: content
                )
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height,
                    alignment: .center
                )
            }
        }
    }
}
