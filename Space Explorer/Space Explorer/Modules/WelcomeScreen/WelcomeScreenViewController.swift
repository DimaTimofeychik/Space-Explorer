import UIKit

final class WelcomeScreenViewController: UIViewController {
    
    //MARK: - Public Properties
    var viewModel: WelcomeScreenViewModel!
    
    //MARK: - UI Properties
    private let titleLabel = UILabel()
    private let settingsButton = UIButton(type: .system)
    private let tableView = UITableView()
    
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        bind()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other screens
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        
        titleLabel.text = "Welcome, Explorer!"
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .systemGray5
        
        settingsButton.tintColor = .systemGray5
        settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        let symbolConfigurationSetup = UIImage.SymbolConfiguration(pointSize: 25)
        settingsButton.setPreferredSymbolConfiguration(symbolConfigurationSetup, forImageIn: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 250
        
    }
    
    private func bind() {
        
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WelcomeScreenTableViewCell.self, forCellReuseIdentifier: "WelcomeScreenTableViewCell")
    }
    
    @objc func settingsButtonTapped() {
        viewModel.settingsButtonTapped()
    }
}


//MARK: - TableView Delegate/DataSource
extension WelcomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeScreenTableViewCell", for: indexPath) as? WelcomeScreenTableViewCell {
            let details = cells[indexPath.row]
            cell.setInformation(cells: details, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let apodViewModel = APODViewModel(networkManager: NetworkManager.instance)
            let apodViewController = APODViewController()
            apodViewController.viewModel = apodViewModel
            
            apodViewModel.fetchAPODData()
            apodViewModel.didUpdateAPOD = { [weak self] apod in
                DispatchQueue.main.async {
                    apodViewController.updateUI(with: apod)
                    self?.navigationController?.pushViewController(apodViewController, animated: true)
                }
            }
        } else if indexPath.row == 1 {
            // Handle other cell selections
        } else if indexPath.row == 2 {
            // Handle other cell selections
        }
    }
}
