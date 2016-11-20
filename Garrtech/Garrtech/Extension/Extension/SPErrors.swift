//
//  SPErrors.swift
//  SleeperPick
//
//  Created by Ankit on 8/9/16.
//  Copyright © 2016 Ashit. All rights reserved.
//

import Foundation

enum SPErrorCode: Int {
    case ServerError = 0
    case EmptyDataError = 1
    case DataParseError = 2
}

struct SPErrors {
    static let EmptyResultError = NSError(domain: "", code: SPErrorCode.EmptyDataError.rawValue, userInfo: [NSLocalizedDescriptionKey : "No Result Found"])
    
    static let ServerError = NSError(domain: "", code: SPErrorCode.ServerError.rawValue, userInfo: [NSLocalizedDescriptionKey : "An error occured while getting data from server."])
    
    static let DataParseError = NSError(domain: "", code: SPErrorCode.DataParseError.rawValue, userInfo: [NSLocalizedDescriptionKey : "An error occured while getting data from server."])
}
