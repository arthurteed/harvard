//  ConfigurationViewController.swift

import UIKit

struct GridData {
    var title: String
    var contents: Array<Position>
    
    static func infoJSON(json: AnyObject) -> GridData! {
        if let dict = json as? Dictionary<String, AnyObject> {
            
            let title = dict["title"] as! String
            let contents = dict["contents"] as! Array<Array<Int>>
            let positions = contents.map({ (array: Array<Int>) -> Position in
                return Position(array.first!,array.last!)
            })
            return GridData(title: title, contents: positions)
        }
        else {
            return nil
        }
    }
}

class ConfigurationViewController: UITableViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        
        fetcher.requestJSON(url) {(json, message) in
            let op = NSBlockOperation {
                if let json = json {
                    self.preconfigs = (json as! Array<AnyObject>).map({ element in
                        return GridData.infoJSON(element)
                    })
                }
            }
            NSOperationQueue.mainQueue().addOperation(op)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        engine.preconfigIndex = nil
        engine.delegate = self
    }
    
    var preconfigs: Array<GridData> {
        get {
            return engine.preconfigs
        }
        set {
            engine.preconfigs = newValue
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preconfigs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Default") else { preconditionFailure("Missing Default reuse identifier") }
        let row = indexPath.row
        guard let titleLabel = cell.textLabel else {
            preconditionFailure("wtf?")
        }
        titleLabel.text = preconfigs[row].title
        cell.tag = row
        return cell
    }
    
    override func tableView(tableView: UITableView,
                            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                                               forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            preconfigs.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath],
                                             withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
    }
    
    func engineDidUpdate(withConfigurations: Array<GridData>) {
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editRow = (sender as! UITableViewCell).tag
        guard let editVC = segue.destinationViewController as? ConfigurationEditorViewController else { preconditionFailure("Error?") }
        
        engine.preconfigIndex = editRow
        editVC.gridtitle = preconfigs[editRow]
        editVC.commit = {
            self.preconfigs[editRow].title = $0
            let indexPath = NSIndexPath(forRow: editRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath],
                                                  withRowAnimation: .Automatic)
            }
        }
    
    @IBAction func newPreconfig(sender: AnyObject) {
        preconfigs.append(GridData(title: "Add new grid...", contents: []))
    }
    
}
