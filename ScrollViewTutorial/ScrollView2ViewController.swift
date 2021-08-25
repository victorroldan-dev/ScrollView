//
//  ScrollView2ViewController.swift
//  ScrollViewTutorial
//
//  Created by Victor Roldan on 22/08/21.
//

import UIKit

class ScrollView2ViewController: UIViewController {
    
    var image1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scroll-image-1")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var image2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scroll-image-2")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(image1)
        stack.addArrangedSubview(image2)
        
        return stack
    }()
    
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView(){
        view.addSubview(scrollView)
        let safeAreaInset = UIApplication.shared.windows.first?.safeAreaInsets
        
        NSLayoutConstraint.activate([
            //ScrollView Constraints
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //Stack Views Constraints
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(safeAreaInset?.top ?? 0.0)),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: safeAreaInset?.bottom ?? 0.0),
            
            //Image Views Constraints
            image1.heightAnchor.constraint(equalToConstant: 730),
            image2.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    

}
