//
//  customCellProfil.swift
//  MassengerApp
//
//  Created by Amaal almutairi on 02/01/2022.
//

import UIKit
import SDWebImage

class customCellchat: UITableViewCell {
  var identifier = "conveCell"
    
    @IBOutlet weak var profilIMG: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    private let userMessageLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 19, weight: .regular)
           label.numberOfLines = 0
           return label
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)

          contentView.addSubview(userMessageLabel)
      }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    override func layoutSubviews() {
           super.layoutSubviews()
        
        userMessageLabel.frame = CGRect(x: profilIMG.right + 10,
                                              y: titleLbl.bottom + 10,
                                              width: contentView.width - 20 - profilIMG.width,
                                              height: (contentView.height-20)/2)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: Conversation) {
           userMessageLabel.text = model.latestMessage.text
           titleLbl.text = model.name

           let path = "images/\(model.otherUserEmail)_profile_picture.png"
           StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
               switch result {
               case .success(let url):

                   DispatchQueue.main.async {
                       self?.profilIMG.sd_setImage(with: url, completed: nil)
                   }

               case .failure(let error):
                   print("failed to get image url: \(error)")
               }
           })
       }

}
