import UIKit

typealias Position = (row:Int, col: Int)

enum CellState {
    case Empty
    case Died
    case Born
    case Alive
    
    func isLiving() -> Bool {
        switch self {
        case .Alive, .Born: return true
        case .Died, .Empty: return false
        }
    }
}

typealias Cell = (position: Position, state: CellState)

protocol GridProtocol {
    var rows: Int { get }
    var cols: Int { get }
    var cells: [Cell] { get set }
    var living: Int { get }
    var dead:   Int { get }
    var alive:  Int { get }
    var born:   Int { get }
    var died:   Int { get }
    var empty:  Int { get }
    
    subscript (i:Int, j:Int) -> CellState { get set }
    
    func neighbors(pos: Position) -> [Position]
    func livingNeighbors(position: Position) -> Int
}

protocol  EngineDelegate: class {
    func engineDidUpdate(withGrid: GridProtocol)
    func engineDidUpdate(withJSON: Array<GridData>)
}

extension EngineDelegate {
    func engineDidUpdate(withJSON: Array<GridData>) {
    }
}

protocol EngineProtocol {
    var rows: Int { get set }
    var cols: Int { get set }
    var grid: GridProtocol { get }
    var preconfigs: Array<GridData> { get set }
    weak var delegate: EngineDelegate? { get set }
    var refreshRate:  Double { get set }
    var refreshTimer: NSTimer? { get set }
    func step() -> GridProtocol
}

typealias CellInitializer = (Position) -> CellState

class StandardEngine: EngineProtocol {
    
    static var _sharedInstance: StandardEngine = StandardEngine(20,20)
    static var sharedInstance: StandardEngine { get { return _sharedInstance } }
    
    var grid: GridProtocol
    
    var rows: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            if let delegate = delegate { delegate.engineDidUpdate(grid) }
        }
    }
    
    var cols: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            if let delegate = delegate { delegate.engineDidUpdate(grid) }
        }
    }
    
    weak var delegate: EngineDelegate?
    
    //INSERT TIMER
    var refreshRate : Double = 0.0
    var refreshTimer: NSTimer?
    var timeCount   : NSTimeInterval = 10
    var count       = 0
    var seconds     = 0
    
    func startTimerWithInterval(refreshRate: NSTimeInterval) {
        seconds = 5
        count = 0
        
        if refreshRate != 0.0 {
            if let timer = refreshTimer { timer.invalidate() }
            let sel = #selector(timerDidFire(_:))
            refreshTimer = NSTimer.scheduledTimerWithTimeInterval(1/refreshRate,
                                                                  target: self,
                                                                  selector: sel,
                                                                  userInfo: nil,
                                                                  repeats: true)
        }
        else if let timer = refreshTimer {
            timer.invalidate()
        }
    }
    
    @objc func timerDidFire(timer:NSTimer) {
        
        seconds -= 1
        NSNotificationCenter.defaultCenter().postNotificationName("NextTimerNotification", object: nil)
        if (seconds == 0) {
            timer.invalidate()
            
        }
    }
    //END TIMER


    subscript (i:Int, j:Int) -> CellState {
        get {
            return grid.cells[i*cols+j].state
        }
        set {
            grid.cells[i*cols+j].state = newValue
        }
    }

    init(_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.grid = Grid(rows,cols, cellInitializer: cellInitializer)
    }
    
    func step() -> GridProtocol {
        var newGrid = Grid(self.rows, self.cols)
        newGrid.cells = grid.cells.map {
            switch grid.livingNeighbors($0.position) {
            case 2 where $0.state.isLiving(),
            3 where $0.state.isLiving():  return Cell($0.position, .Alive)
            case 3 where !$0.state.isLiving(): return Cell($0.position, .Born)
            case _ where $0.state.isLiving():  return Cell($0.position, .Died)
            default:                           return Cell($0.position, .Empty)
            }
        }
        grid = newGrid
        if let delegate = delegate { delegate.engineDidUpdate(grid) }
        return grid
    }
    
    var preconfigIndex: Int?
    var preconfig: GridData? {
        get {
            if delegate is ConfigurationEditorViewController {
                return preconfigs[preconfigIndex!]
            }
            return nil
        }
        set {
            if delegate is ConfigurationEditorViewController {
                preconfigs[preconfigIndex!] = newValue!
            }
        }
    }
    
    var preconfigs: Array<GridData> = [] {
        didSet {
            if let delegate = delegate { delegate.engineDidUpdate(self.preconfigs)}
        }
    }
    
    func updateGridBasedOnConfiguration() {
        if let preconfig = preconfig {
            let newGrid = Grid(rows, cols) { position in
                return preconfig.contents.contains({ return position.row == $0.row && position.col == $0.col }) ? .Alive : .Empty
            }
            
            grid = newGrid
        }
    }
    
    

}

struct Grid: GridProtocol {
    private(set) var rows: Int
    private(set) var cols: Int
    var cells: [Cell]
    
    var living: Int { return cells.reduce(0) { return  $1.state.isLiving() ?  $0 + 1 : $0 } }
    var dead:   Int { return cells.reduce(0) { return !$1.state.isLiving() ?  $0 + 1 : $0 } }
    var alive:  Int { return cells.reduce(0) { return  $1.state == .Alive  ?  $0 + 1 : $0 } }
    var born:   Int { return cells.reduce(0) { return  $1.state == .Born   ?  $0 + 1 : $0 } }
    var died:   Int { return cells.reduce(0) { return  $1.state == .Died   ?  $0 + 1 : $0 } }
    var empty:  Int { return cells.reduce(0) { return  $1.state == .Empty  ?  $0 + 1 : $0 } }
    
    init (_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.cells = (0..<rows*cols).map {
            let pos = Position($0/cols, $0%cols)
            return Cell(pos, cellInitializer(pos))
        }
    }
    
    subscript (i:Int, j:Int) -> CellState {
        get {
            return cells[i*cols+j].state
        }
        set {
            cells[i*cols+j].state = newValue
        }
    }
    
    private static let offsets:[Position] = [
        (-1, -1), (-1, 0), (-1, 1),
        ( 0, -1),          ( 0, 1),
        ( 1, -1), ( 1, 0), ( 1, 1)
    ]
    func neighbors(pos: Position) -> [Position] {
        return Grid.offsets.map { Position((pos.row + rows + $0.row) % rows,
            (pos.col + cols + $0.col) % cols) }
    }
    
    func livingNeighbors(position: Position) -> Int {
        return neighbors(position)
            .reduce(0) {
                self[$1.row,$1.col].isLiving() ? $0 + 1 : $0
        }
    }
}
