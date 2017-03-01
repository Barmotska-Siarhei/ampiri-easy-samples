//
//  BannerVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class BannerVC: UIViewController {
    
    fileprivate var bannerView: AMPBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmpiriSDK.shared().loadBanner(with: CGSize(width: 320, height: 50),
                                      adUnitId: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69",
                                      success: {[weak self] ( banner: AMPBannerView?) in
                                        guard let sSelf = self, let myBanner = banner else {return}
                                        myBanner.center = CGPoint(x: sSelf.view.frame.size.width/2, y: sSelf.view.frame.size.height/2)
                                        sSelf.view.addSubview(myBanner)
                                        sSelf.bannerView = myBanner
                                      },
                                      failure: { (error: AMPError?) in
                                        print("Error : \(error?.localizedDescription)")
                                      })
    }

}
