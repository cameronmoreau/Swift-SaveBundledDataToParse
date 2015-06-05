//
//  BundleViewController.swift
//  SaveBundledDataToParse
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class BundleViewController: UIViewController {
    
    @IBOutlet weak var textViewData: UITextView!
    
    var jsonData:NSString?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewData.text = jsonData! as String
    }

}
