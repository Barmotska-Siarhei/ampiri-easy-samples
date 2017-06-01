//
//  CollectionViewVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

private let reuseIdentifier = "MyCollectionViewCell"

class CollectionViewVC: UICollectionViewController {
    
    var adapter: AMPCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adapter = AmpiriSDK.shared.createStreamAdapter(for: collectionView!,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             templateType: .feed,
                                                             delegate: nil,
                                                             templateCustomization: { templateCustomizationObject in
                                                                templateCustomizationObject.ampCTABorderWidth = 1
                                                                templateCustomizationObject.ampCTACornerRadius = 5
                                                            })
        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
    
        cell.nameLabel.text = "#\(indexPath.row)"
        return cell
    }
 
}

extension CollectionViewVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int((collectionView.frame.size.width - 2 ) / 2), height: 40)
    }
}
