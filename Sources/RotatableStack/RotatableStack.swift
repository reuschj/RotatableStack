//
//  RotatableStack.swift
//  AnalogClock
//
//  Created by Justin Reusch on 10/26/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import SwiftUI

/**
 A view that embeds in a `VStack` when in portrait orientation and `HStack` in landscape orientation
 */
@available(iOS 13.0, *)
@available(OSX 10.15, *)
public struct RotatableStack<Content>: View where Content : View {
    
    /// Stores the content function builder
    public var content: () -> Content
    
    /**
     - Parameters:
     - content: The view builder content to pass
     */
    @inlinable public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
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
            if self.getOrientation(from: geometry) == .portrait {
                VStack {
                    self.content()
                }
            } else {
                HStack {
                    self.content()
                }
            }
        }
    }
}
