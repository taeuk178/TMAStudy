//My template contents of name Weather

import UIKit
import WeatherInterface

final public class WeatherViewController: UIViewController {

    private let fetchWeatherUseCase: FetchWeatherUseCase

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, Weather!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let button: UIButton = {
        let label = UIButton(type: .custom)
        label.setTitle("API 요청", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public init(fetchWeatherUseCase: FetchWeatherUseCase) {
        self.fetchWeatherUseCase = fetchWeatherUseCase
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        button.addTarget(self, action: #selector(setButtonAction(_:)), for: .touchUpInside)
    }

    @objc
    private func setButtonAction(_ sender: UIButton) {
        Task {
            do {
                let weatherData = try await fetchWeatherUseCase.execute()
                await MainActor.run {
                    label.text = """
                    Latitude: \(weatherData.latitude)
                    Longitude: \(weatherData.longitude)
                    Timezone: \(weatherData.timezone)
                    """
                }
            } catch {
                await MainActor.run {
                    label.text = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
