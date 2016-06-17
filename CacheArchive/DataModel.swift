//
//  DataModel.swift
//  CacheArchive
//
//  Created by sseen on 16/6/17.
//  Copyright © 2016年 sseen. All rights reserved.
//

import UIKit

let kName = "name"
let kPass =  "pass"
let kNsuser = "nsuser"

class DataModel: NSObject, NSCoding{
    var name:String!
    var pass:String!
    
    init(name:String, pass:String) {
        self.name = name
        self.pass = pass
    }
    
    override init() {
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey(kName) as! String
        self.pass = aDecoder.decodeObjectForKey(kPass) as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: kName)
        aCoder.encodeObject(self.pass, forKey: kPass)
    }
    
    func save() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: kNsuser)
    }
    
    func clear() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(kNsuser)
    }
    
    class func loadSaved() -> DataModel? {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kNsuser) as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? DataModel
        }
        return nil
    }
}
