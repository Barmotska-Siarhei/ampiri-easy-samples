//
//  FullscreenVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class FullscreenVC: UIViewController {

    fileprivate var interstitial: AMPFullscreenBannerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmpiriSDK.shared().loadFullscreen(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92",
                                          options: .default,
                                          for: self,
                                          success: {[weak self] (fullscreen: AMPFullscreenBannerController?) in
                                            guard let sSelf = self, let myFullscreen = fullscreen else {return}
                                            sSelf.interstitial = myFullscreen
                                            myFullscreen.show(from: sSelf)
                                          },
                                          failure: { (error: AMPError?) in
                                            print("Error : \(error?.localizedDescription)")
                                          })
    }
}
