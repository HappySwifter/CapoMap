//  This file was automatically generated and should not be edited.

import Apollo

public final class RegisterMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Register($name: String, $email: String, $password: String) {\n  createUser(name: $name, email: $email, password: $password) {\n    __typename\n    email\n  }\n}"

  public var name: String?
  public var email: String?
  public var password: String?

  public init(name: String? = nil, email: String? = nil, password: String? = nil) {
    self.name = name
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["name": name, "email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["name": GraphQLVariable("name"), "email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Email of the user, or null if unknown.
      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}