//
//  AuthService.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 29.03.2022.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInFailed()
    func authServiceLoginPage()
    func authServiceSecondPage()
    func authServiceLogout()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    //MARK: - Fields
    private let appId = "8117667"
    private let vkSDK: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appId)
        super.init()
        vkSDK.register(self)
        vkSDK.uiDelegate = self
    }

    func checkSessionOnStart() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .authorized:
                print("authorized")
                delegate?.authServiceSecondPage()
           default:
                delegate?.authServiceLoginPage()
                
            }
            
        }
    }
    
    func wakeUpSession(){
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            default:
                fatalError(error!.localizedDescription)
                delegate?.authServiceSignInFailed()
            }
            
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInFailed()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
