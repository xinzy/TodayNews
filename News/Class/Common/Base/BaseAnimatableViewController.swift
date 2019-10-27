//
//  BaseAnimatableViewController.swift
//  News
//
//  Created by Yang on 2019/10/26.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable

class BaseAnimatableViewController: AnimatableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.theme_backgroundColor = "colors.main"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
