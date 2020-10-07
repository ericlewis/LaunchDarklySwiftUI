//
//  ObservedVariation.swift
//
//  Created by Eric Lewis on 10/6/20.
//

import SwiftUI
import LaunchDarkly

@propertyWrapper
public struct ObservedVariation<T: LDFlagValueConvertible>: DynamicProperty {
    @Environment(\.launchDarklyClient) private var defaultClient
    @ObservedObject private var observer: ObservableVariation<T>
    
    let defaultValue: T
    
    public var wrappedValue: T {
        observer.flag ?? defaultValue
    }
    
    public init(_ key: LDFlagKey, defaultValue: T, client: LDClient? = nil) {
        self.defaultValue = defaultValue
        self.observer = ObservableVariation(key)
        self.observer.observe(client: client ?? defaultClient)
    }
}
