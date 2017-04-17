//
//  PKScreens.swift
//
//  Created by  on 17/04/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PKScreens: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let targetObjectClassID = "targetObjectClassID"
    static let mobileIconURL = "mobileIconURL"
    static let targetObjectID = "targetObjectID"
    static let targetObjectType = "targetObjectType"
    static let classID = "classID"
    static let moduleID = "moduleID"
    static let orderInModule = "orderInModule"
    static let isDocumentsScreen = "isDocumentsScreen"
    static let id = "id"
    static let targetActionType = "targetActionType"
    static let targetName = "targetName"
    static let caption = "caption"
  }

  // MARK: Properties
  public var targetObjectClassID: String?
  public var mobileIconURL: String?
  public var targetObjectID: String?
  public var targetObjectType: Int?
  public var classID: String?
  public var moduleID: String?
  public var orderInModule: Int?
  public var isDocumentsScreen: Bool? = false
  public var id: String?
  public var targetActionType: Int?
  public var targetName: String?
  public var caption: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    targetObjectClassID = json[SerializationKeys.targetObjectClassID].string
    mobileIconURL = json[SerializationKeys.mobileIconURL].string
    targetObjectID = json[SerializationKeys.targetObjectID].string
    targetObjectType = json[SerializationKeys.targetObjectType].int
    classID = json[SerializationKeys.classID].string
    moduleID = json[SerializationKeys.moduleID].string
    orderInModule = json[SerializationKeys.orderInModule].int
    isDocumentsScreen = json[SerializationKeys.isDocumentsScreen].boolValue
    id = json[SerializationKeys.id].string
    targetActionType = json[SerializationKeys.targetActionType].int
    targetName = json[SerializationKeys.targetName].string
    caption = json[SerializationKeys.caption].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = targetObjectClassID { dictionary[SerializationKeys.targetObjectClassID] = value }
    if let value = mobileIconURL { dictionary[SerializationKeys.mobileIconURL] = value }
    if let value = targetObjectID { dictionary[SerializationKeys.targetObjectID] = value }
    if let value = targetObjectType { dictionary[SerializationKeys.targetObjectType] = value }
    if let value = classID { dictionary[SerializationKeys.classID] = value }
    if let value = moduleID { dictionary[SerializationKeys.moduleID] = value }
    if let value = orderInModule { dictionary[SerializationKeys.orderInModule] = value }
    dictionary[SerializationKeys.isDocumentsScreen] = isDocumentsScreen
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = targetActionType { dictionary[SerializationKeys.targetActionType] = value }
    if let value = targetName { dictionary[SerializationKeys.targetName] = value }
    if let value = caption { dictionary[SerializationKeys.caption] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.targetObjectClassID = aDecoder.decodeObject(forKey: SerializationKeys.targetObjectClassID) as? String
    self.mobileIconURL = aDecoder.decodeObject(forKey: SerializationKeys.mobileIconURL) as? String
    self.targetObjectID = aDecoder.decodeObject(forKey: SerializationKeys.targetObjectID) as? String
    self.targetObjectType = aDecoder.decodeObject(forKey: SerializationKeys.targetObjectType) as? Int
    self.classID = aDecoder.decodeObject(forKey: SerializationKeys.classID) as? String
    self.moduleID = aDecoder.decodeObject(forKey: SerializationKeys.moduleID) as? String
    self.orderInModule = aDecoder.decodeObject(forKey: SerializationKeys.orderInModule) as? Int
    self.isDocumentsScreen = aDecoder.decodeBool(forKey: SerializationKeys.isDocumentsScreen)
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.targetActionType = aDecoder.decodeObject(forKey: SerializationKeys.targetActionType) as? Int
    self.targetName = aDecoder.decodeObject(forKey: SerializationKeys.targetName) as? String
    self.caption = aDecoder.decodeObject(forKey: SerializationKeys.caption) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(targetObjectClassID, forKey: SerializationKeys.targetObjectClassID)
    aCoder.encode(mobileIconURL, forKey: SerializationKeys.mobileIconURL)
    aCoder.encode(targetObjectID, forKey: SerializationKeys.targetObjectID)
    aCoder.encode(targetObjectType, forKey: SerializationKeys.targetObjectType)
    aCoder.encode(classID, forKey: SerializationKeys.classID)
    aCoder.encode(moduleID, forKey: SerializationKeys.moduleID)
    aCoder.encode(orderInModule, forKey: SerializationKeys.orderInModule)
    aCoder.encode(isDocumentsScreen, forKey: SerializationKeys.isDocumentsScreen)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(targetActionType, forKey: SerializationKeys.targetActionType)
    aCoder.encode(targetName, forKey: SerializationKeys.targetName)
    aCoder.encode(caption, forKey: SerializationKeys.caption)
  }

}
