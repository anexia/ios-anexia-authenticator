//
//  Account.swift
//  Anexia Authenticator
//
//  Created by Michael Rauter on 02.03.18.
//  Copyright © 2018 Anexia. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object {
    @objc dynamic var id : String = NSUUID().uuidString
    @objc dynamic var secret : String = ""
    @objc dynamic var issuer : String = ""
    @objc dynamic var username : String = ""
    @objc dynamic var digits : Int = 6
    @objc dynamic var period : Int = 30
    @objc dynamic var engine : Bool = false
    
    @objc dynamic var selected : Bool = false
    @objc dynamic var created : Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["selected"]
    }
    
    internal static func readAllFromRealm() -> [Account] {
        let realm = try! Realm()
        return Array(realm.objects(Account.self).sorted(byKeyPath: "created", ascending: true))
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let item = Account()
        item.secret = self.secret
        item.issuer = self.issuer
        item.username = self.username
        item.digits = self.digits
        item.period = self.period
        return item
    }
}
