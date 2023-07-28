import Foundation

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
    
    func append(task: Task) {
        tasks.append(task)
    }
    
    func remove(at: Int) {
        tasks.remove(at: at)
    }
    
    func task(at indexPath: IndexPath) -> Task{
        tasks[indexPath.row]
    }
}
