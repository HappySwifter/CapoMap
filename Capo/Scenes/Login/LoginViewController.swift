//
//  LoginViewController.swift
//  Capo
//
//  Created by Артем Валиев on 12/12/2018.
//  Copyright (c) 2018 Артем Валиев. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Apollo

protocol LoginDisplayLogic: class
{
  func displayUser(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
    deinit {
        Log("", type: .warning)
    }
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: LGButton!
    @IBOutlet weak var registerButton: LGButton!
    @IBOutlet weak var prodDevControl: UISegmentedControl!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    assert(navigationController != nil, "LoginViewController should be presented on navigation controller stack")
    navigationController?.setNavigationBarHidden(true, animated: false)
    #if DEBUG
    emailField.text = "Artem"
    passwordField.text = "4005"
    #else
    rodDevControl.isHidden = true
    #endif
    
    loginButton.applyLoginSettings(title: "Войти")
    registerButton.applyLoginSettings(title: "Регистрация")
  }
  


  func displayUser(viewModel: Login.Something.ViewModel)
  {
    router?.routeToProfile()
  }
    
    @IBAction func loginPressed() {
        guard let email = emailField.text, email.count > 0 else {
            return
        }
        guard let password = passwordField.text, password.count > 0 else {
            return
        }
        
        let credentials = Credentials(email: email, password: password)
        let req = Login.Something.Request(credentials: credentials)
        interactor?.login(request: req)
    }
    
    @IBAction func registerPressed() {
        router?.routeToRegisterController()
    }
    
    @IBAction func prodDevControlValueChanged() {
        
    }
}


