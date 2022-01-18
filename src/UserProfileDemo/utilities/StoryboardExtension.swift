//
//  UserProfileDemo
//  Copyright © 2022 Couchbase Inc. All rights reserved.
/*
import UIKit

extension UIStoryboard {
    enum Storyboard:String {
        case Main = "Main"
        
    }
    
    enum StoryboardSegue {
        
        
    }
    
    class func getStoryboard(_ storyboard:Storyboard,bundle:Bundle? = nil )->UIStoryboard {
        return UIStoryboard(name:storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewControllerWithIdentifier<T:UIViewController>()->T where T:StoryboardIdentifiable {
        let vc =  self.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        if let viewController = vc as? T {
            return viewController
        }
        fatalError("Check identifier of viewcontroller in storyboard")
        
    }
    
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier:String {get}
}

extension StoryboardIdentifiable where Self:UIViewController {
    static var storyboardIdentifier:String {
        return String(describing: self)
    }
}
*/
