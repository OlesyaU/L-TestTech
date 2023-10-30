//
//  UserModel.swift
//  L-TestTech
//
//  Created by Олеся on 27.10.2023.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var phone: String
    @Persisted var password: String
    convenience init(phone: String, password: String) {
          self.init()
          self.phone = phone
          self.password = password
      }
}
