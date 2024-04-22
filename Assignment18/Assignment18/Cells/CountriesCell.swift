import UIKit

class CountriesCell: UITableViewCell {
    static let identifier = "CountriesCell"
    
    // MARK: - UI Components
    
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var arrowSymbol: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
        addSubview(rectangleView)
        rectangleView.addSubview(countryLabel)
        rectangleView.addSubview(countryImageView)
        rectangleView.addSubview(arrowSymbol)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            rectangleView.heightAnchor.constraint(equalToConstant: 60),
            
            countryLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 10),
            countryLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            
            countryImageView.trailingAnchor.constraint(equalTo: arrowSymbol.leadingAnchor, constant: -10),
            countryImageView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            countryImageView.widthAnchor.constraint(equalToConstant: 30),
            countryImageView.heightAnchor.constraint(equalToConstant: 20),
            
            arrowSymbol.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -10),
            arrowSymbol.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor)
        ])
    }
}
