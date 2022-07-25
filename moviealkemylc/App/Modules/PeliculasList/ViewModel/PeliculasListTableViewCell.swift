//
//  PeliculasListTableViewCell.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//


import Foundation
import UIKit
import Kingfisher

class PeliculasListTableViewCell: UITableViewCell {

    var name: String? {
        didSet {
            peliculaName.text = name
        }
    }
    
     var imgUrl: String?
    
 
    
    
     lazy var placeholderImage: UIImageView = {
        let aImage = UIImageView()
        
        aImage.translatesAutoresizingMaskIntoConstraints = false
        
        aImage.backgroundColor = .lightGray
        let url = URL(string: imgUrl ?? "https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI")
        aImage.kf.setImage(with: url)
        
      
        
  
        contentView.addSubview(aImage)
        return aImage
    }()
    
    private lazy var peliculaName: UILabel = {
        let aLabel = UILabel()
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setupConstraints()
    }
    
    private func setupConstraints(){

        NSLayoutConstraint.activate([
            
            placeholderImage.widthAnchor.constraint(equalToConstant: 100),
            
            
            placeholderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeholderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placeholderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            peliculaName.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor, constant: 16),
            peliculaName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            peliculaName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            peliculaName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    
        ])
        
    }
    
    
}
