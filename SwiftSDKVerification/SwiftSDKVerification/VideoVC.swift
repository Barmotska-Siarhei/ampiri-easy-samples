//
//  VideoVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class VideoVC: UIViewController {
    
    fileprivate var video: AMPVideoController?

    override func viewDidLoad() {
        super.viewDidLoad()
        AmpiriSDK.shared().loadVideo(withAdUnitId: "87f65c4c-f12d-4bb6-96fd-063fe30c4d69",
                                     success: { [weak self] (video: AMPVideoController?) in
                                        guard let sSelf = self, let myVideo = video else {return}
                                        sSelf.video = myVideo
                                        myVideo.show(from: sSelf)
                                     },
                                     failure: { (error: AMPError?) in
                                        print("Error : \(error?.localizedDescription)")
                                     })
    }
    
}
