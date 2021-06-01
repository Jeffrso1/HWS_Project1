//
//  DetailsViewController.swift
//  project1_Returns
//
//  Created by Jefferson Silva on 22/05/21.
//

import UIKit

class DetailsViewController: UIViewController {

    var current: Int!
    var count: Int!
    
    var nsslImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //------------------------------------------------------------------------------------
    
    init(image imageName: String, number: Int, of total: Int) {
        super.init(nibName: nil, bundle: nil)
            
        current = number
        count = total
        
        if let picture = UIImage(named: imageName) {
            nsslImage.image = picture
        } else {
            nsslImage.image = UIImage(named: "nssl0049.jpg")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Picture \(String(current)) of \(String(count))"
        
        view.addSubview(nsslImage)
        setupNsslImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupNsslImage(){
        NSLayoutConstraint.activate([
            nsslImage.topAnchor.constraint(equalTo: view.topAnchor),
            nsslImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nsslImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nsslImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
