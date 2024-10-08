//
//  Copyright (c) 2020 Cristian Ortega Gómez (https://github.com/corteggo)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import NavigationRouter

/// Test feature 1 module definition
public final class TestFeature1Module: RoutableModule {
    // MARK: - Initializers
    
    /// Initializes a new instance
    public init() {
        // Initialize instance here as needed
    }
    
    // MARK: - Routing
    
    /// Registers navigation routers
    public func registerRoutes() {
        // Define routes
        let view1ARoute: NavigationRoute = NavigationRoute(
            path: "/view1A",
            type: ViewModel1A.self,
            requiresAuthentication: false)
        let view1BRoute: NavigationRoute = NavigationRoute(
            path: "/view1B",
            type: ViewModel1B.self,
            requiresAuthentication: false,
            allowedExternally: true)
        let view1BNumRoute: NavigationRoute = NavigationRoute(
            path: "/view1B/:num",
            type: ViewModel1C.self,
            requiresAuthentication: false,
            allowedExternally: true)
        let view1CRoute: NavigationRoute = NavigationRoute(
            path: "/view1C",
            type: ViewModel1C.self,
            requiresAuthentication: true)
        
        let closureRoute:NavigationRoute = NavigationRoute(path: "/view1C", { params in
            debugPrint("参数是:\(params)")
        })
        
        // Register routes
        NavigationRouter.bind(route: view1ARoute)
        NavigationRouter.bind(route: view1BRoute)
        NavigationRouter.bind(route: view1BNumRoute)
        NavigationRouter.bind(route: view1CRoute)
        NavigationRouter.bind(route: closureRoute)
    }
}
