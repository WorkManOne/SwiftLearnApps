import Foundation
import UIKit

protocol RatingStarsViewDelegate: AnyObject {
    func ratingDidChange(newRating: Int)
}

@IBDesignable
class RatingStarsView: UIView {
    weak var delegate: RatingStarsViewDelegate?

    @IBInspectable var image: UIImage = UIImage(systemName: "star")!
    {
        didSet {
            setup()
        }
    }
    @IBInspectable var highlightedImage: UIImage = UIImage(systemName: "star.fill")!
    {
        didSet {
            setup()
        }
    }
    @IBInspectable var spacing : CGFloat = 8
    {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var rating: Int = 0
    {
        didSet {
            update()
            delegate?.ratingDidChange(newRating: rating)
        }
    }
    
    @IBInspectable var stars: Int = 5
    {
        didSet {
            setup()
        }
    }
    
    private let stackView = UIStackView()
    private var starViews: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = spacing
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        stackView.arrangedSubviews.forEach { (view) in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        starViews.removeAll()
        
        
        for _ in 0..<stars {
            let imageView = UIImageView()
            imageView.image = image
            imageView.highlightedImage = highlightedImage
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapped(_:)))
            imageView.addGestureRecognizer(tapGesture)
            
            starViews.append(imageView)
            stackView.addArrangedSubview(imageView)
        }
    }
    
    @objc private func starTapped(_ gesture: UITapGestureRecognizer) {
        guard let index = starViews.firstIndex(of: gesture.view as! UIImageView) else {
            return
        }
        
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    private func update() {
        for (index, imageView) in starViews.enumerated() {
            imageView.isHighlighted = index < rating
        }
    }
    
    override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setup()
            update()
    }
}
