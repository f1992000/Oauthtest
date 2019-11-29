//
//  ViewController.swift
//  cURLTT
//
//  Created by  DARFON on 2019/11/18.
//  Copyright © 2019  DARFON. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        iosSwich3()
    }

    func iosSwich3(){
        // create an instance and retain it
        let oauthswift = OAuth2Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            authorizeUrl:   "https://www.strava.com/oauth/authorize",
            responseType:   "token"
        )
        let handle = oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-swift://darfon.developers.strava")!,
            scope: "read_all", state:"") { result in
            switch result {
            case .success(let (credential, response, parameters)):
              print(credential.oauthToken)
              // Do your request
            case .failure(let error):
              print(error.localizedDescription)
            }
        }
    }
}
