//
//  Entity+CoreDataProperties.swift
//  CoreDataPhoto
//
//  Created by Gabriel Martinez on 2018-02-12.
//  Copyright © 2018 Gabriel Martinez. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var titletext: String?
    @NSManaged public var descriptiontext: String?
    @NSManaged public var image: NSData?

}
