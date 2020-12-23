//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private var exposition: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ExpositionViewController {
    
    private func decodeExpositionData() {
        
        let jasonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1990") else {
            return
        }
        guard let expositionData = try? jasonDecoder.decode(Exposition.self, from: assetData.data) else {
            return
        }
        exposition = expositionData
    }
}
