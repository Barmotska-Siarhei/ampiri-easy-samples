//
//  TableViewVC.swift
//  SwiftSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

import UIKit
import AmpiriSDK

class TableViewVC: UITableViewController {
    fileprivate var adapter: AMPTableViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter = AmpiriSDK.shared().addLocationControl(to: tableView,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             templateType: .inFeed,
                                                             templateCustomization: { templateCustomizationObject in
                                                                templateCustomizationObject.ampCTABorderWidth = 1
                                                                templateCustomizationObject.ampCTACornerRadius = 5
                                                            })
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.amp_dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.nameLabel.text = "#\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
 
}
