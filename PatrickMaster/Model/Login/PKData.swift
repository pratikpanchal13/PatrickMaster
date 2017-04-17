//
//  PKLoginData.swift
//
//  Created by  on 17/04/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PKLoginData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let availableModules = "availableModules"
    static let homeScreenID = "homeScreenID"
    static let password = "password"
    static let userPreferredLanguageID = "userPreferredLanguageID"
    static let userName = "userName"
    static let lastLoginLanguageID = "lastLoginLanguageID"
  }

  // MARK: Properties
  public var availableModules: [PKAvailableModules]?
  public var homeScreenID: String?
  public var password: String?
  public var userPreferredLanguageID: Int?
  public var userName: String?
  public var lastLoginLanguageID: Int?

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
    if let items = json[SerializationKeys.availableModules].array { availableModules = items.map { PKAvailableModules(json: $0) } }
    homeScreenID = json[SerializationKeys.homeScreenID].string
    password = json[SerializationKeys.password].string
    userPreferredLanguageID = json[SerializationKeys.userPreferredLanguageID].int
    userName = json[SerializationKeys.userName].string
    lastLoginLanguageID = json[SerializationKeys.lastLoginLanguageID].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = availableModules { dictionary[SerializationKeys.availableModules] = value.map { $0.dictionaryRepresentation() } }
    if let value = homeScreenID { dictionary[SerializationKeys.homeScreenID] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = userPreferredLanguageID { dictionary[SerializationKeys.userPreferredLanguageID] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = lastLoginLanguageID { dictionary[SerializationKeys.lastLoginLanguageID] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.availableModules = aDecoder.decodeObject(forKey: SerializationKeys.availableModules) as? [PKAvailableModules]
    self.homeScreenID = aDecoder.decodeObject(forKey: SerializationKeys.homeScreenID) as? String
    self.password = aDecoder.decodeObject(forKey: SerializationKeys.password) as? String
    self.userPreferredLanguageID = aDecoder.decodeObject(forKey: SerializationKeys.userPreferredLanguageID) as? Int
    self.userName = aDecoder.decodeObject(forKey: SerializationKeys.userName) as? String
    self.lastLoginLanguageID = aDecoder.decodeObject(forKey: SerializationKeys.lastLoginLanguageID) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(availableModules, forKey: SerializationKeys.availableModules)
    aCoder.encode(homeScreenID, forKey: SerializationKeys.homeScreenID)
    aCoder.encode(password, forKey: SerializationKeys.password)
    aCoder.encode(userPreferredLanguageID, forKey: SerializationKeys.userPreferredLanguageID)
    aCoder.encode(userName, forKey: SerializationKeys.userName)
    aCoder.encode(lastLoginLanguageID, forKey: SerializationKeys.lastLoginLanguageID)
  }

}
