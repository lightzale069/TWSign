import UIKit

class MainViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let signButton = UIButton(type: .system)
    let statusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clean, bright system background (Adapts to system dark/light mode automatically)
        view.backgroundColor = .systemBackground
        
        // Minimalist Header
        titleLabel.text = "TWSign"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .label // Adapts text color for light/dark mode
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 20, y: 120, width: view.frame.width - 40, height: 40)
        view.addSubview(titleLabel)
        
        // Subtle Subtitle
        subtitleLabel.text = "Local Application Signing Suite"
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .center
        subtitleLabel.frame = CGRect(x: 20, y: 165, width: view.frame.width - 40, height: 20)
        view.addSubview(subtitleLabel)
        
        // Clean, solid accent button (Native system tint)
        signButton.setTitle("Sign Application", for: .normal)
        signButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        signButton.setTitleColor(.white, for: .normal)
        signButton.backgroundColor = .systemBlue // Clean iOS blue tint
        signButton.layer.cornerRadius = 12 // Smooth, modern rounded corners
        signButton.frame = CGRect(x: 40, y: view.frame.height / 2 - 25, width: view.frame.width - 80, height: 54)
        signButton.addTarget(self, action: #selector(startSigning), for: .touchUpInside)
        view.addSubview(signButton)
        
        // Minimal Status Text
        statusLabel.text = "Ready"
        statusLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        statusLabel.textColor = .tertiaryLabel
        statusLabel.textAlignment = .center
        statusLabel.frame = CGRect(x: 20, y: view.frame.height / 2 + 50, width: view.frame.width - 40, height: 20)
        view.addSubview(statusLabel)
    }
    
    @objc func startSigning() {
        statusLabel.text = "Signing..."
        statusLabel.textColor = .systemBlue
        
        SignEngine.shared.sign(ipaName: "target.ipa") { success in
            DispatchQueue.main.async {
                if success {
                    self.statusLabel.text = "Signing complete"
                    self.statusLabel.textColor = .systemGreen
                    LocalServer.shared.startAndInstall()
                } else {
                    self.statusLabel.text = "Signing failed"
                    self.statusLabel.textColor = .systemRed
                }
            }
        }
    }
}
