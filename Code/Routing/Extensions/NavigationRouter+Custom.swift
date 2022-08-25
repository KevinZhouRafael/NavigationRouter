//
//  NavigationRouter+Custom.swift
//  WDBook
//
//  Created by kai zhou on 2022/4/14.
//

import Foundation
import SwiftUI
import UIKit

public extension NavigationRouter{
    
    func pushViewController(_ vc:UIViewController,animated:Bool = true){
        topNavigationController?.pushViewController(vc, animated: animated)
    }
    
    func popToRoot(){
        rootNavigationController?.popToRootViewController(animated: false)
    }
    
    var rootNavigationController:UINavigationController?{
        rootViewController as? UINavigationController
    }
    
    var rootViewController:UIViewController?{
        keyWindow?.rootViewController
    }
    
    var topViewController: UIViewController? {
        var resultVC = getTopVC(keyWindow?.rootViewController)
        while let presentedVC = resultVC?.presentedViewController {
            resultVC = getTopVC(presentedVC)
        }
        return resultVC
    }
    
    var topNavigationController:UINavigationController?{
        if let topNav = topViewController?.navigationController{
            return topNav
        }else{
            return rootNavigationController
        }
    }
    
    internal func getTopVC(_ vc: UIViewController?) -> UIViewController? {
        if let navc = vc as? UINavigationController {
            return getTopVC(navc.topViewController)
        } else if let tabvc = vc as? UITabBarController {
            return getTopVC(tabvc.selectedViewController)
        } else {
            return vc
        }
    }
}


extension Set where Element == NavigationRoute{
    func match(where predicate: (Element) throws -> Bool,priority priorityPredicate: (Element) throws -> Bool) rethrows -> Element?{
        if let priorityOne = try first(where: priorityPredicate){
            return priorityOne
        }
        
        return try first(where: predicate)
    }
}

