
#if os(macOS) || os(Linux)
import Foundation

@discardableResult
public func shell(_ bash: String) -> Data {
    let task = Process()
    task.launchPath = "/bin/bash/"
    task.arguments = ["-c", bash]
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    task.waitUntilExit()
    return pipe.fileHandleForReading.readDataToEndOfFile()
}
#endif
