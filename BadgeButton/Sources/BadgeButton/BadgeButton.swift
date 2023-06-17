import UIKit

class BadgeButton: UIButton {
    private let badgeDotSize: CGFloat = 20.0
    
    private var badgeDotView: UIView?
    private var badgeTitle: String?
    var badgeColor: UIColor = UIColor.red {
        didSet {
            badgeDotView?.backgroundColor = badgeColor
        }
    }
    
    var badgeVisible: Bool = false {
        didSet {
            badgeDotView?.isHidden = !badgeVisible
        }
    }
    
    var badgeValue: String = "" {
        didSet {
            badgeTitle = badgeValue
        }
    }
    
    private var badgeLabel: UILabel?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if badgeDotView == nil {
            createBadgeDotView()
        }
        
        positionBadgeDotView()
        createBadgeLabel()
    }
    
    private func createBadgeLabel() {
        if badgeLabel == nil {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            label.textColor = .label
            addSubview(label)
            badgeLabel = label
        }
        badgeLabel?.text = badgeTitle
        badgeLabel?.sizeToFit()
        badgeLabel?.center = badgeDotView?.center ?? CGPoint.zero
        bringSubviewToFront(badgeLabel!)
    }
    
    private func createBadgeDotView() {
        let badgeDotView = UIView(frame: CGRect(x: 0, y: 0, width: badgeDotSize, height: badgeDotSize))
        badgeDotView.backgroundColor = badgeColor
        badgeDotView.layer.cornerRadius = badgeDotSize / 2
        badgeDotView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(badgeDotView)
        
        let constraints = [
            badgeDotView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            badgeDotView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            badgeDotView.widthAnchor.constraint(equalToConstant: badgeDotSize),
            badgeDotView.heightAnchor.constraint(equalToConstant: badgeDotSize)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        self.badgeDotView = badgeDotView
        
    }
    
    private func positionBadgeDotView() {
        guard let badgeDotView = badgeDotView else { return }

        badgeDotView.isHidden = !badgeVisible

        badgeDotView.removeFromSuperview()
        addSubview(badgeDotView)

        let constraints = [
            badgeDotView.topAnchor.constraint(equalTo: topAnchor, constant: bounds.height * 0.3), // Adjust the constant value as needed
            badgeDotView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            badgeDotView.widthAnchor.constraint(equalToConstant: badgeDotSize),
            badgeDotView.heightAnchor.constraint(equalToConstant: badgeDotSize)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
