//
//  FirstViewController.swift
//  ITMSMetrics
//
//  Created by ademturkoglu on 9.05.2020.
//  Copyright © 2020 ademturkoglu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var metrics = [Metric]()
    var selected: Metric?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        parseFruits()
    }
    
  func parseFruits() {
      let url = Bundle.main.url(forResource:"ITMSMetrics", withExtension: "json")!
    let jsonData = try! Data(contentsOf: url)
      self.metrics = try! JSONDecoder().decode([Metric].self, from: jsonData)
     print(metrics)
     
  }


}
extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = metrics[indexPath.row]
        performSegue(withIdentifier: "ShowMetric", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMetric"{
            let detailVC = segue.destination as! DetailViewController
            detailVC.metric = selected
        }
    }
    
}
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return metrics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let metric = metrics[indexPath.row]
        cell.metricNameLabel.text = metric.name
        cell.meticGoalLabel.text = metric.goal
        
        return cell
    }
}

struct Metric : Codable {
    var id: String
    var name: String
    var goal: String

}

