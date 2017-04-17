//
//  PKAvailableModules.swift
//
//  Created by  on 17/04/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PKAvailableModules: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let classID = "classID"
    static let screens = "screens"
    static let iconURL = "iconURL"
    static let order = "order"
    static let caption = "caption"
  }

  // MARK: Properties
  public var id: String?
  public var classID: String?
  public var screens: [PKScreens]?
  public var iconURL: String?
  public var order: Int?
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
    id = json[SerializationKeys.id].string
    classID = json[SerializationKeys.classID].string
    if let items = json[SerializationKeys.screens].array { screens = items.map { PKScreens(json: $0) } }
    iconURL = json[SerializationKeys.iconURL].string
    order = json[SerializationKeys.order].int
    caption = json[SerializationKeys.caption].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = classID { dictionary[SerializationKeys.classID] = value }
    if let value = screens { dictionary[SerializationKeys.screens] = value.map { $0.dictionaryRepresentation() } }
    if let value = iconURL { dictionary[SerializationKeys.iconURL] = value }
    if let value = order { dictionary[SerializationKeys.order] = value }
    if let value = caption { dictionary[SerializationKeys.caption] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.classID = aDecoder.decodeObject(forKey: SerializationKeys.classID) as? String
    self.screens = aDecoder.decodeObject(forKey: SerializationKeys.screens) as? [PKScreens]
    self.iconURL = aDecoder.decodeObject(forKey: SerializationKeys.iconURL) as? String
    self.order = aDecoder.decodeObject(forKey: SerializationKeys.order) as? Int
    self.caption = aDecoder.decodeObject(forKey: SerializationKeys.caption) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(classID, forKey: SerializationKeys.classID)
    aCoder.encode(screens, forKey: SerializationKeys.screens)
    aCoder.encode(iconURL, forKey: SerializationKeys.iconURL)
    aCoder.encode(order, forKey: SerializationKeys.order)
    aCoder.encode(caption, forKey: SerializationKeys.caption)
  }

}
