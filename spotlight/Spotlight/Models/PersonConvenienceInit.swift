//
//  PersonConvenienceInit.swift
//  Spotlight
//
//  Created by Stephen Davis on 9/13/21.
//

import CoreData

extension Person {
  convenience init(context: NSManagedObjectContext = CoreDataStack.context, name: String, bio: String? = "", url: String? = "") {
    self.init(context: context)
    self.id = UUID().uuidString
    self.name = name
    self.bio = bio
    self.url = url
  }
}
