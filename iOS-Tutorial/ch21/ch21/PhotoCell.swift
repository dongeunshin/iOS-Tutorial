//
//  PhotoCell.swift
//  ch21
//
//  Created by dong eun shin on 4/18/25.
//

import UIKit
import SnapKit
import Then

final class PhotoCell: UICollectionViewCell {
    static let identifier: String = "PhotoCell"
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textAlignment = .center
        $0.textColor = .label
    }
    
    var title: String? {
        didSet {
            guard let title = title else { return }
            
            self.titleLabel.text = title
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
