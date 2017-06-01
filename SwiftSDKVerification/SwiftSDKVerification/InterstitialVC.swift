//
//  InterstitialVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class InterstitialVC: UIViewController {

    fileprivate var interstitial: AMPInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmpiriSDK.shared.loadInterstitial(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92",
                                          success: {[weak self] (interstitial: AMPInterstitial?) in
                                            guard let sSelf = self, let myInterstitial = interstitial else {return}
                                            sSelf.interstitial = myInterstitial
                                            myInterstitial.show(from: sSelf)
                                          },
                                          failure: { (error: AMPError?) in
                                            guard let message = error?.localizedDescription else {return}
                                            print("Error : \(message)")
                                          })
    }
}
