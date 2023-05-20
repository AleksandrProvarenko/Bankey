//
//  OnboardingVC.swift
//  Bankey
//
//  Created by Alex Provarenko on 19.05.2023.
//

import UIKit

class OnboardingVC: UIViewController {
    
    let stackView = UIStackView()
    let image = UIImageView()
    let label = UILabel()
    
    let imageName: String
    let titleText: String
    
    init(imageName: String, titleText: String) {
        self.imageName = imageName
        self.titleText = titleText
        
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension OnboardingVC {
    
    func style() {
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: imageName)
        
        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = titleText
    }
    
    func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)
    
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
