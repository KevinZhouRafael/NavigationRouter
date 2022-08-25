//
//  BaseRoutableVM.swift
//  WDBook
//
//  Created by kai zhou on 2022/4/14.
//

import Foundation
import SwiftUI

/// Routable view model
struct BaseRoutableVM: RoutableViewModel {
    // MARK: - Routing
    
    /// Required navigation parameters (if any)
    static var requiredParameters: [String]?
    
    /// Navigation interception execution flow (if any)
    var navigationInterceptionExecutionFlow: NavigationInterceptionFlow?
    
    /// Initializes a new instance
    /// - Parameter parameters: Navigation parameters
    init(parameters: [String : String]?) {
        // Do something with parameters (e.g. instantiating a model)
    }
    
    /// View body
    var routedView: AnyView {
        AnyView(EmptyView())
    }
}
