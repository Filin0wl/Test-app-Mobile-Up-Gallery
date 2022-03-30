//
//  AuthService.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 29.03.2022.
//

import Foundation
import VKSdkFramework


class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    //MARK: - Fields
    private let appId = "8117667"
    private let vkSDK: VKSdk
    
    override init() {
        vkSDK = VKSdk.initialize(withAppId: appId)
        super.init()
        vkSDK.register(self)
        vkSDK.uiDelegate = self
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
