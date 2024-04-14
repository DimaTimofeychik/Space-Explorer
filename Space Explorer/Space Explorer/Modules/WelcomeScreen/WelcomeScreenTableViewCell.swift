import UIKit

final class WelcomeScreenTableViewCell: UITableViewCell {
    
    //MARK: - Private Properties
    private let containerView = UIView()
    private var backgroundImageView = UIImageView()
    private var titleLabel = UILabel()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
    }
    
    private func configureUI() {
        contentView.backgroundColor = .black
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        
        backgroundImageView.layer.cornerRadius = 15
        backgroundImageView.clipsToBounds = true
        
        titleLabel.textColor = .systemGray5
        titleLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
    }
    
    func setInformation(cells: WelcomeScreenInfo, indexPath: IndexPath) {
        backgroundImageView.image = cells.backgroundImage
        titleLabel.text = cells.title
    }
    
}
