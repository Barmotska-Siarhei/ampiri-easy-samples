//
//  NativeVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class NativeVC: UIViewController {

    fileprivate var nativeAdView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmpiriSDK.shared().loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                        parentViewController: self,
                                        adViewClassForRendering: MyNativeBannerView.self,
                                        success: {[weak self] (adContainer: UIView?) in
                                            guard let sSelf = self, let adView = adContainer else {return}
                                                adView.center =  CGPoint(x: sSelf.view.frame.size.width/2, y: sSelf.view.frame.size.height/2)
                                                sSelf.nativeAdView = adView
                                                sSelf.view.addSubview(adView)

                                        },
                                        failure: { (error: AMPError?) in
                                            print("Error : \(error?.localizedDescription)")
                                        })
    }

}
