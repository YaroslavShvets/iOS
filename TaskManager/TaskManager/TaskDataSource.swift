import UIKit

class TaskDataSource {
    
    var tasks: [Task]
    
    init() {
        tasks = [
            Task(name: "Horse", state: true),
            Task(name: "Cow", state: true),
            Task(name: "Camel", state: true),
            Task(name: "Lizard", state: true),
            Task(name: "Dog", state: true),
            
        ]
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func append(task: Task, to tableView: UITableView) {
        tasks.append(task)
        tableView.insertRows(at: [IndexPath(row: tasks.count-1, section: 0)], with: .automatic)
    }
    
    func remove(at: Int) {
        tasks.remove(at: at)
    }
    
    func task(at indexPath: IndexPath) -> Task{
        tasks[indexPath.row]
    }
}
