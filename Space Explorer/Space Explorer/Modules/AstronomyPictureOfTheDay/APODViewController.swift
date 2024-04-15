import UIKit

final class APODViewController: UIViewController {
    //MARK: - Public Properties
    var viewModel: APODViewModel!
    
    private var currentAPOD: APOD?
    
    //MARK: - UI Properties
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contantTextView = UITextView()
    
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        bind()
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contantTextView)
    }
    
    private func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        contantTextView.translatesAutoresizingMaskIntoConstraints = false
        contantTextView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contantTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contantTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contantTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contantTextView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        contantTextView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        
    }
    private func configureUI() {
        view.backgroundColor = .black
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .systemGray5
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.text = "Title"
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        scrollView.backgroundColor = .clear
        contantTextView.backgroundColor = .clear
        
        contantTextView.font = UIFont.systemFont(ofSize: 16)
        contantTextView.textColor = .systemGray5
        contantTextView.textAlignment = .justified
        contantTextView.text = "Description"
    }
    
    private func bind() {
            guard let viewModel = viewModel else { return }
            
            viewModel.fetchAPODData()
            viewModel.didUpdateAPOD = { [weak self] apod in
                DispatchQueue.main.async {
                    self?.currentAPOD = apod
                    self?.updateUI(with: apod)
                    
                    if apod.mediaType == "video" {
                        self?.showVideoAlert()
                    }
                }
            }
        }
    
    func updateUI(with apod: APOD) {
        titleLabel.text = apod.title
        contantTextView.text = apod.explanation
            
            if let url = URL(string: apod.url) {
                URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                        return
                    }
                    
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.imageView.image = image
                        }
                    } else {
                        print("Invalid image data")
                    }
                }.resume()
            } else {
                print("Invalid URL")
            }
        }
        
        private func showVideoAlert() {
            let alert = UIAlertController(title: "Open Video", message: "Do you want to open this video in Safari?", preferredStyle: .alert)
            
            let openAction = UIAlertAction(title: "Open", style: .default) { [weak self] _ in
                if let videoURL = URL(string: self?.currentAPOD?.url ?? "") {
                    UIApplication.shared.open(videoURL, options: [:], completionHandler: nil)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(openAction)
            alert.addAction(cancelAction)
            
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
}
