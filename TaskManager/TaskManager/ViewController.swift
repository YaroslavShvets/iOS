import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddScreenViewDelegate {
    
    func addTask(_ task: Task) {
        taskDataSource.append(task: task )
        tableView.insertRows(at: [IndexPath(row: taskDataSource.numberOfTasks()-1, section: 0)], with: .automatic)
    }
    
    
    var taskDataSource = TaskDataSource()
    let cellReuseIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
     
    @IBAction func newCellButton(_ sender: Any) {
        
        let addScreenView = AddScreenView(nibName: nil, bundle: nil)
        addScreenView.delegate = self
        present(addScreenView, animated: true)
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskDataSource.numberOfTasks()
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = taskDataSource.task(at: indexPath).name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let strikeText : NSAttributedString = NSAttributedString.init(string: taskDataSource.task(at: indexPath).name, attributes:  [NSAttributedString.Key.strikethroughStyle: 1])
            let unstrikeText : NSAttributedString = NSAttributedString.init(string: taskDataSource.task(at: indexPath).name, attributes:  [NSAttributedString.Key.strikethroughStyle: 0])
            
            if let cell = tableView.cellForRow(at: indexPath){
                
                if taskDataSource.tasks[indexPath.row].state{
                    
                    cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                    cell.textLabel?.attributedText = strikeText
                    taskDataSource.tasks[indexPath.row].state = false
                }
                else {
                    
                    cell.accessoryType = UITableViewCell.AccessoryType.none
                    cell.textLabel?.attributedText = unstrikeText
                    taskDataSource.tasks[indexPath.row].state = true

                }
            }
        
        for val in taskDataSource.tasks{
            print(val)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete{
                
                taskDataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                for val in taskDataSource.tasks{
                    print(val)
                }
                
                    
                
                
            }
    }
}
