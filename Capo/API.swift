//  This file was automatically generated and should not be edited.

import Apollo

/// On of the event type
public enum EventType: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Seminar
  case seminar
  /// Roda
  case roda
  /// Training
  case training
  /// Party
  case party
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "seminar": self = .seminar
      case "roda": self = .roda
      case "training": self = .training
      case "party": self = .party
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .seminar: return "seminar"
      case .roda: return "roda"
      case .training: return "training"
      case .party: return "party"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: EventType, rhs: EventType) -> Bool {
    switch (lhs, rhs) {
      case (.seminar, .seminar): return true
      case (.roda, .roda): return true
      case (.training, .training): return true
      case (.party, .party): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class RegisterMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Register($name: String!, $email: String!, $password: String!) {\n  createUser(name: $name, email: $email, password: $password) {\n    __typename\n    email\n  }\n}"

  public var name: String
  public var email: String
  public var password: String

  public init(name: String, email: String, password: String) {
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

public final class LoginMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Login($email: String!, $password: String!) {\n  loginUser(email: $email, password: $password) {\n    __typename\n    string\n    expiresAt\n    user {\n      __typename\n      ...UserPayload\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(UserPayload.fragmentDefinition) }

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("loginUser", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(LoginUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginUser: LoginUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "loginUser": loginUser.flatMap { (value: LoginUser) -> ResultMap in value.resultMap }])
    }

    public var loginUser: LoginUser? {
      get {
        return (resultMap["loginUser"] as? ResultMap).flatMap { LoginUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "loginUser")
      }
    }

    public struct LoginUser: GraphQLSelectionSet {
      public static let possibleTypes = ["UserToken"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("string", type: .scalar(String.self)),
        GraphQLField("expiresAt", type: .scalar(String.self)),
        GraphQLField("user", type: .object(User.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(string: String? = nil, expiresAt: String? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "UserToken", "string": string, "expiresAt": expiresAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Token
      public var string: String? {
        get {
          return resultMap["string"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "string")
        }
      }

      /// expiresAt
      public var expiresAt: String? {
        get {
          return resultMap["expiresAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "expiresAt")
        }
      }

      /// user for token
      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserPayload.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(email: String? = nil, id: Int, profileImagePath: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "profileImagePath": profileImagePath])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var userPayload: UserPayload {
            get {
              return UserPayload(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpdateUser($name: String, $imagePath: String) {\n  updateUser(name: $name, profileImagePath: $imagePath) {\n    __typename\n    ...UserPayload\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(UserPayload.fragmentDefinition) }

  public var name: String?
  public var imagePath: String?

  public init(name: String? = nil, imagePath: String? = nil) {
    self.name = name
    self.imagePath = imagePath
  }

  public var variables: GraphQLMap? {
    return ["name": name, "imagePath": imagePath]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["name": GraphQLVariable("name"), "profileImagePath": GraphQLVariable("imagePath")], type: .object(UpdateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.flatMap { (value: UpdateUser) -> ResultMap in value.resultMap }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (resultMap["updateUser"] as? ResultMap).flatMap { UpdateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserPayload.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String? = nil, id: Int, profileImagePath: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "profileImagePath": profileImagePath])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var userPayload: UserPayload {
          get {
            return UserPayload(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreateEventMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateEvent($name: String!, $eventType: EventType!) {\n  createEvent(name: $name, eventType: $eventType) {\n    __typename\n    title\n    eventType\n  }\n}"

  public var name: String
  public var eventType: EventType

  public init(name: String, eventType: EventType) {
    self.name = name
    self.eventType = eventType
  }

  public var variables: GraphQLMap? {
    return ["name": name, "eventType": eventType]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createEvent", arguments: ["name": GraphQLVariable("name"), "eventType": GraphQLVariable("eventType")], type: .object(CreateEvent.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEvent": createEvent.flatMap { (value: CreateEvent) -> ResultMap in value.resultMap }])
    }

    public var createEvent: CreateEvent? {
      get {
        return (resultMap["createEvent"] as? ResultMap).flatMap { CreateEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createEvent")
      }
    }

    public struct CreateEvent: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("eventType", type: .nonNull(.scalar(EventType.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String? = nil, eventType: EventType) {
        self.init(unsafeResultMap: ["__typename": "Event", "title": title, "eventType": eventType])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// title
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// event type
      public var eventType: EventType {
        get {
          return resultMap["eventType"]! as! EventType
        }
        set {
          resultMap.updateValue(newValue, forKey: "eventType")
        }
      }
    }
  }
}

public struct UserPayload: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment UserPayload on User {\n  __typename\n  email\n  id\n  profileImagePath\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("email", type: .scalar(String.self)),
    GraphQLField("id", type: .nonNull(.scalar(Int.self))),
    GraphQLField("profileImagePath", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(email: String? = nil, id: Int, profileImagePath: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "profileImagePath": profileImagePath])
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

  /// The id of the user.
  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Image path of the user profile, or null if unknown.
  public var profileImagePath: String? {
    get {
      return resultMap["profileImagePath"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "profileImagePath")
    }
  }
}