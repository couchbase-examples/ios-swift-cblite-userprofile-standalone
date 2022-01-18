//  UserProfileDemo
//  Copyright © 2022 Couchbase Inc. All rights reserved.

import Foundation
import UIKit

let kUserRecordDocumentType = "user"
typealias ExtendedData = [[String:Any]]
struct UserRecord : CustomStringConvertible{
    let type = kUserRecordDocumentType
    var name:String?
    var email:String?
    var address:String?
    var imageData:Data?
    var extended:ExtendedData? // future
    
    var description: String {
        return "name = \(String(describing: name)), email = \(String(describing: email)), address = \(String(describing: address)), imageData = \(imageData)"
    }
}
