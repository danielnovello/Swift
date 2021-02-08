#!/usr/bin/swift
import Foundation

//ByteCountFormatter
let formatter = ByteCountFormatter()
formatter.allowedUnits = .useAll
formatter.countStyle = .file
formatter.includesUnit = true
formatter.isAdaptive = true

//Calculate
let fileURL = URL(fileURLWithPath:"/")
do {
    let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
    if let capacity = values.volumeAvailableCapacityForImportantUsage {
        //Pretty
        print("<result>\(formatter.string(fromByteCount: (capacity)))</result>")
        //Bytes
        //print(capacity)
    } else {
        print("Capacity is unavailable")
    }
} catch {
    print("Error retrieving capacity: \(error.localizedDescription)")
}