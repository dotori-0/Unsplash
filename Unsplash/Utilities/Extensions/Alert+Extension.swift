//
//  Alert+Extension.swift
//  Unsplash
//
//  Created by SC on 2022/10/30.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
