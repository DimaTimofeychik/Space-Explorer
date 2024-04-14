import UIKit

final class SettingsViewController: UIViewController {
    
    var viewModel: SettingsViewModel!
    
    private let titleLabel = UILabel()
    private let backButton = UIButton()

    private let termsOfUseView = UIView()
    private let privacyPolicyView = UIView()
    private let iconTermsImageView = UIImageView()
    private let iconPrivacyImageView = UIImageView()
    private let termsLabel = UILabel()
    private let privacyLabel = UILabel()
    private let termsNextArrowImageView = UIImageView()
    private let privacyNextArrowImageView = UIImageView()
    private let termsOfUseButton = UIButton()
    private let privacyPolicyButton = UIButton()
    
    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        bindings()
        
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setCornerRadius()
    }
    
    // MARK: - Add subviews
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(termsOfUseView)
        view.addSubview(privacyPolicyView)
        termsOfUseView.addSubview(termsOfUseButton)
        privacyPolicyView.addSubview(privacyPolicyButton)
        termsOfUseButton.addSubview(termsLabel)
        termsOfUseButton.addSubview(termsNextArrowImageView)
        termsOfUseButton.addSubview(iconTermsImageView)
        privacyPolicyButton.addSubview(privacyLabel)
        privacyPolicyButton.addSubview(privacyNextArrowImageView)
        privacyPolicyButton.addSubview(iconPrivacyImageView)
    }
    
    //MARK: - Configure constraintes
    
    private func configureConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        termsOfUseView.translatesAutoresizingMaskIntoConstraints = false
        termsOfUseView.topAnchor.constraint(equalTo: backButton.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        termsOfUseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        termsOfUseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        termsOfUseView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iconTermsImageView.translatesAutoresizingMaskIntoConstraints = false
        iconTermsImageView.topAnchor.constraint(equalTo: termsOfUseView.topAnchor, constant: 5).isActive = true
        iconTermsImageView.leadingAnchor.constraint(equalTo: termsOfUseView.leadingAnchor, constant: 5).isActive = true
        iconTermsImageView.bottomAnchor.constraint(equalTo: termsOfUseView.bottomAnchor, constant: -5).isActive = true
        iconTermsImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        termsNextArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        termsNextArrowImageView.topAnchor.constraint(equalTo: termsOfUseView.topAnchor, constant: 11).isActive = true
        termsNextArrowImageView.trailingAnchor.constraint(equalTo: termsOfUseView.trailingAnchor, constant: -11).isActive = true
        termsNextArrowImageView.bottomAnchor.constraint(equalTo: termsOfUseView.bottomAnchor, constant: -11).isActive = true
        termsNextArrowImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.topAnchor.constraint(equalTo: termsOfUseView.topAnchor, constant: 7).isActive = true
        termsLabel.leadingAnchor.constraint(equalTo: iconTermsImageView.trailingAnchor, constant: 10).isActive = true
        termsLabel.bottomAnchor.constraint(equalTo: termsOfUseView.bottomAnchor, constant: -7).isActive = true
        termsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 125).isActive = true
        
        termsOfUseButton.translatesAutoresizingMaskIntoConstraints = false
        termsOfUseButton.topAnchor.constraint(equalTo: termsOfUseView.topAnchor).isActive = true
        termsOfUseButton.leadingAnchor.constraint(equalTo: termsOfUseView.leadingAnchor).isActive = true
        termsOfUseButton.trailingAnchor.constraint(equalTo: termsOfUseView.trailingAnchor).isActive = true
        termsOfUseButton.bottomAnchor.constraint(equalTo: termsOfUseView.bottomAnchor).isActive = true
        
        privacyPolicyView.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyView.topAnchor.constraint(equalTo: termsOfUseView.bottomAnchor, constant: 20).isActive = true
        privacyPolicyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        privacyPolicyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        privacyPolicyView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        iconPrivacyImageView.translatesAutoresizingMaskIntoConstraints = false
        iconPrivacyImageView.topAnchor.constraint(equalTo: privacyPolicyView.topAnchor, constant: 5).isActive = true
        iconPrivacyImageView.leadingAnchor.constraint(equalTo: privacyPolicyView.leadingAnchor, constant: 5).isActive = true
        iconPrivacyImageView.bottomAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: -5).isActive = true
        iconPrivacyImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        privacyNextArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        privacyNextArrowImageView.topAnchor.constraint(equalTo: privacyPolicyView.topAnchor, constant: 11).isActive = true
        privacyNextArrowImageView.trailingAnchor.constraint(equalTo: privacyPolicyView.trailingAnchor, constant: -11).isActive = true
        privacyNextArrowImageView.bottomAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: -11).isActive = true
        privacyNextArrowImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.topAnchor.constraint(equalTo: privacyPolicyView.topAnchor, constant: 7).isActive = true
        privacyLabel.leadingAnchor.constraint(equalTo: iconPrivacyImageView.trailingAnchor, constant: 10).isActive = true
        privacyLabel.bottomAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: -7).isActive = true
        privacyLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 125).isActive = true
        
        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.topAnchor.constraint(equalTo: privacyPolicyView.topAnchor).isActive = true
        privacyPolicyButton.leadingAnchor.constraint(equalTo: privacyPolicyView.leadingAnchor).isActive = true
        privacyPolicyButton.trailingAnchor.constraint(equalTo: privacyPolicyView.trailingAnchor).isActive = true
        privacyPolicyButton.bottomAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor).isActive = true
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        view.backgroundColor = .black

        titleLabel.text = "Settings"
        titleLabel.textColor = .systemGray5
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        backButton.backgroundColor = .black
        backButton.tintColor = .systemGray5
        let symbolConfigurationAdd = UIImage.SymbolConfiguration(pointSize: 28)
        backButton.setPreferredSymbolConfiguration(symbolConfigurationAdd, forImageIn: .normal)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        termsOfUseView.layer.borderColor = UIColor.systemGray5.cgColor
        termsOfUseView.layer.borderWidth = 1
        
        privacyPolicyView.layer.borderColor = UIColor.systemGray5.cgColor
        privacyPolicyView.layer.borderWidth = 1
        
        iconTermsImageView.image = UIImage(named: "roundedTerms")
        iconTermsImageView.contentMode = .scaleAspectFit
        
        termsNextArrowImageView.tintColor = .systemGray5
        termsNextArrowImageView.image = UIImage(systemName: "chevron.forward")
        termsNextArrowImageView.contentMode = .scaleAspectFit
        
        termsLabel.textAlignment = .left
        termsLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        termsLabel.textColor = .systemGray5
        termsLabel.text = "Item Terms Of Use"
        
        iconPrivacyImageView.image = UIImage(named: "roundedPrivacy")
        iconPrivacyImageView.contentMode = .scaleAspectFit
        
        privacyNextArrowImageView.tintColor = .systemGray5
        privacyNextArrowImageView.image = UIImage(systemName: "chevron.forward")
        privacyNextArrowImageView.contentMode = .scaleAspectFit
        
        privacyLabel.textAlignment = .left
        privacyLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        privacyLabel.textColor = .systemGray5
        privacyLabel.text = "Item Privacy Policy"
        
        termsOfUseButton.backgroundColor = .black
        termsOfUseButton.addTarget(self, action: #selector(termsOfUseButtonTapped), for: .touchUpInside)
        
        privacyPolicyButton.backgroundColor = .black
        privacyPolicyButton.addTarget(self, action: #selector(privacyPolicyButtonTapped), for: .touchUpInside)
    }
    
    private func setCornerRadius() {
        termsOfUseView.layer.cornerRadius = termsOfUseView.frame.height / 2
        termsOfUseView.clipsToBounds = true
        privacyPolicyView.layer.cornerRadius = privacyPolicyView.frame.height / 2
        privacyPolicyView.clipsToBounds = true
        iconTermsImageView.layer.cornerRadius = iconTermsImageView.frame.height / 2
        iconTermsImageView.clipsToBounds = true
        iconPrivacyImageView.layer.cornerRadius = iconPrivacyImageView.frame.height / 2
        iconPrivacyImageView.clipsToBounds = true
        backButton.layer.cornerRadius = termsOfUseView.frame.height / 2
        backButton.clipsToBounds = true
    }
    
    //MARK: - Actions
    
    @objc private func termsOfUseButtonTapped() {
        print("Terms of Use")
    }
    
    @objc private func privacyPolicyButtonTapped() {
        print("Privacy policy")
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Bindings
    
    private func bindings() {
        
    }
}
