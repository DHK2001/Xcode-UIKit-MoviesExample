import Foundation
import UIKit

class NavBar: UIView {
    private let location: String
    
    // Back button with an SF Symbol icon
    let backButton: UIButton = {
        let backButton = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.left") // Use a SF Symbol for the back arrow
        backButton.setImage(image, for: .normal)
        backButton.tintColor = .white // Set the arrow color
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    let titleContainer: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBlue
        return containerView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    // Custom initializer with location
    init(location: String) {
        self.location = location
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup the views and layout
    func setupView() {
        titleContainer.addSubview(movieName)
        titleContainer.addSubview(backButton) // Add backButton to the title container
        addSubview(titleContainer)
        
        NSLayoutConstraint.activate([
            titleContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleContainer.bottomAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            
            // Back button layout (aligned to the left of the container)
            backButton.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 10),
            backButton.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            // Movie name layout (centered with padding)
            movieName.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            movieName.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            movieName.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -20)
        ])
    }
    
    // Function to set movie title
    func setText(titleString: String) {
        movieName.text = titleString
    }
}
