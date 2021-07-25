//
//  MyTableViewCell.swift
//  HW_41.8
//
//  Created by Mykhailo Romanovskyi on 25.07.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var mainImageView: UIImageView!
    var title: UILabel!
    var playImage: UIImageView!
    
    static let reuseID = "CustomCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        mainImageView = UIImageView()
        mainImageView.backgroundColor = .black
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleToFill
        addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        playImage = UIImageView(image: UIImage(systemName: "play.circle"))
        playImage.tintColor = .gray
        addSubview(playImage)
        playImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playImage.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -10),
            playImage.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 10),
            playImage.widthAnchor.constraint(equalToConstant: 40),
            playImage.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        title = UILabel()
        addSubview(title)
        title.numberOfLines = 0
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: playImage.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: playImage.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        mainImageView.image = UIImage()
    }
}
