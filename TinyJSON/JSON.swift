//
//  JSON.swift
//  TinyJSON
//
//  Created by 王义川 on 15/7/17.
//  Copyright © 2015年 肇庆市创威发展有限公司. All rights reserved.
//

import Foundation


public enum JSON {
    case Object([Swift.String: JSON])
    case Array([JSON])
    case String(Swift.String)
    case Number(NSNumber)
    case Bool(Swift.Bool)
}

extension JSON {
    public var string: Swift.String {
        switch self {
        case let .Object(v):
            var string = ""
            if !v.isEmpty {
                let colon: Character = ":"
                let comma: Character = ","
                for (key, value) in v {
                    string += "\"\(key)\""
                    string.insert(colon, atIndex: string.endIndex)
                    string += value.string
                    string.insert(comma, atIndex: string.endIndex)
                }
                string.removeAtIndex(string.endIndex.predecessor())
            }
            return "{\(string)}"
        case let .Array(v):
            var string = ""
            if !v.isEmpty {
                let comma: Character = ","
                for item in v {
                    string += item.string
                    string.insert(comma, atIndex: string.endIndex)
                }
                string.removeAtIndex(string.endIndex.predecessor())
            }
            return "[\(string)]"
        case let .String(v):
            return "\"\(v)\""
        case let .Number(v):
            return "\(v)"
        case let .Bool(v):
            return "\(v)"
        }
    }
}