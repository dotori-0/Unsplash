//
//  BaseViewController.swift
//  Unsplash
//
//  Created by SC on 2022/10/28.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setHierarchy()
        setConstraints()
    }
    
    // MARK: - Setting Methods
    func setUI() {
        view.backgroundColor = .systemBackground
    }
    
    func setHierarchy() { }
    
    func setConstraints() { }
}
