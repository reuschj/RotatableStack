//
//  FlexAlignment.swift
//
//  Created by Justin Reusch on 01/29/22.
//  Copyright © 2022 Justin Reusch. All rights reserved.
//

import SwiftUI

/// An alignment that expresses the alignment of elements
/// that could be horizontal or vertical depending on device
/// orientation. Rather than being strictly horizontal or vertical,
/// this can apply to either and converted as necessary.
@available(iOS 13.0, *)
@available(OSX 10.15, *)
@available(watchOS 6.0, *)
public enum FlexAlignment {
    case leading
    case center
    case trailing

    /// Converts to horizontal alignment for use with portrait orientation.
    public var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }

    /// Converts to vertical alignment for use with landscape orientation.
    public var verticalAlignment: VerticalAlignment {
        switch self {
        case .leading:
            return .top
        case .center:
            return .center
        case .trailing:
            return .bottom
        }
    }
}
