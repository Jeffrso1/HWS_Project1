//
//  PicturesTableViewCell.swift
//  project1_Returns
//
//  Created by Jefferson Silva on 22/05/21.
//

import UIKit

class PicturesTableViewCell: UITableViewCell {

    var imagePreview: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var imageName: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPicturesCell(picture: String) {
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(imagePreview)
        contentView.addSubview(imageName)
        
        setupImageDisplay()
        setupLabelDisplay()
        
        imagePreview.image = UIImage(named: picture)
        imageName.text = picture
    }
    
    func setupImageDisplay() {
        NSLayoutConstraint.activate([
            imagePreview.heightAnchor.constraint(equalToConstant: 100),
            imagePreview.widthAnchor.constraint(equalTo: imagePreview.heightAnchor),
            imagePreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imagePreview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imagePreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        imagePreview.layer.cornerRadius = 5
        imagePreview.layer.borderWidth = 1
        imagePreview.layer.borderColor = UIColor(named: "black")?.cgColor
    }
    
    func setupLabelDisplay() {
        NSLayoutConstraint.activate([
            imageName.leadingAnchor.constraint(equalTo: imagePreview.trailingAnchor, constant: 20),
            imageName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageName.centerYAnchor.constraint(equalTo: imagePreview.centerYAnchor)
        ])
    }
}
