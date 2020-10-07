//
//  ObservableVariation.swift
//
//  Created by Eric Lewis on 10/6/20.
//

import SwiftUI
import Combine
import LaunchDarkly
import LaunchDarkly_Combine

final class ObservableVariation<T: LDFlagValueConvertible>: ObservableObject {
    @Published var flag: T?
    
    let key: LDFlagKey
    var cancellable: AnyCancellable?
    
    init(_ key: LDFlagKey) {
        self.key = key
    }
    
    func observe(client: LDClient) {
        cancellable = client.variationPublisher(forKey: key)
            .sink { [weak self] in
                self?.flag = $0
            }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
