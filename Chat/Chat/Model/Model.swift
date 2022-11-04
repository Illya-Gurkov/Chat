//
//  Model.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import Foundation
import UIKit

enum AuthResponce {
    case success, noVerify, error
}

struct Slides {
    var id: Int
    var text: String
    var img: UIImage
}

struct LoginField{
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
    
}

struct CurentUser {
    var id: String
    var email : String
}
