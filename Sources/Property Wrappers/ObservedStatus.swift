//
//  ObservedStatus.swift
//
//  Created by Eric Lewis on 10/7/20.
//

import SwiftUI
import LaunchDarkly

@propertyWrapper
public struct ObservedStatus: DynamicProperty {
    @Environment(\.launchDarklyClient) private var defaultClient
    @ObservedObject private var observer: ObservableStatus
    
    public var wrappedValue: ConnectionInformation.ConnectionMode? {
        observer.status
    }
    
    public init(client: LDClient? = nil) {
        self.observer = ObservableStatus()
        self.observer.observe(client: client ?? defaultClient)
    }
}
