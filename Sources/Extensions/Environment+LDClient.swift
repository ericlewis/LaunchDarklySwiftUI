//
//  Environment+LaunchDarkly.swift
//
//  Created by Eric Lewis on 10/6/20.
//

import SwiftUI
import LaunchDarkly

struct LaunchDarklyClientReferenceEnvironmentKey: EnvironmentKey {
    static let defaultValue: LDClient = LDClient.get()!
}

extension EnvironmentValues {
    /// The LaunchDarkly client for this environment
    public var launchDarklyClient: LDClient {
        get {
            return self[LaunchDarklyClientReferenceEnvironmentKey]
        }
        set {
            self[LaunchDarklyClientReferenceEnvironmentKey] = newValue
        }
    }
}
