//
//  ObservableObservableOptions.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 06.11.2020.
//

import UIKit

public struct ObservableOptions: OptionSet, CustomStringConvertible {
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var description: String {
        switch self {
        case .initial:
            return "initial"
        case .new:
            return "new"
        case .old:
            return "old"
        default:
            return "ObservableOptions (rawValue: \(rawValue))"
        }
    }
    
}
