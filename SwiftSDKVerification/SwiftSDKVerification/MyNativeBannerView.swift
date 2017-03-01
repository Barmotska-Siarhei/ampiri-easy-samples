//
//  MyNativeBannerView.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class MyNativeBannerView: AMPNativeView {
    
    static func desiredHeight() -> Double {
        return 70
    }
    
    override static func xibName () -> String {
        return "MyNativeBannerView"
    }
    
}
