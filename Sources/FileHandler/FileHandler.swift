//
//  File.swift
//
//
//  Created by Vitor on 04/04/24.
//

import Foundation

public struct FileHandler {
    public static var projectName: String {
        get {
            _projectName
        }
        set {
            _projectName = newValue
                .replacingOccurrences(of: " ", with: "-")
                .lowercased()
        }
    }
    private static var _projectName: String = ""
    

    //    public static func readPlainText(at path: String, separator: String = "\n") throws -> [String] {
    //        let url = try buildURL(appending: path)
    //        let data = try Data(contentsOf: url)
    //        let string = String(bytes: data, encoding: .utf8)
    //        var components = string?.components(separatedBy: separator) ?? []
    //        if components.last?.isEmpty ?? false { components.removeLast() }
    //        return components
    //    }
    //
    //    public static func listContents(in path: String) throws -> [String] {
    //        let url = try buildURL(appending: path)
    //        let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: [])
    //        return contents.map { $0.lastPathComponent }
    //    }
    //
    //    private static func buildURL(appending path: String) throws -> URL {
    //        // Get the path of the current file
    //        let currentFileURL = URL(fileURLWithPath: #file)
    //        // Navigate to the package directory
    //        let packageDirectory = currentFileURL.deletingLastPathComponent().deletingLastPathComponent()
    //
    //        let projectFolder = packageDirectory.appendingPathComponent("Themes")
    //
    //        if !FileManager.default.fileExists(atPath: projectFolder.relativePath) {
    //            try FileManager.default.createDirectory(at: projectFolder, withIntermediateDirectories: true)
    //        }
    //
    //        var components = path.components(separatedBy: "/")
    //        components.removeLast() // removing file from path components
    //
    //        components.indices.forEach { index in
    //            var folderURL = projectFolder.appendingPathComponent(components[0])
    //            if index != 0 {
    //                folderURL.appendPathComponent(Array(1...index).map { components[$0] }.joined(separator: "/"))
    //            }
    //        }
    //
    //        return projectFolder.appendingPathComponent(path)
    //    }
    
    public static func readPlainText(at path: String, separator: String = "\n") throws -> [String] {
        let url = try buildURL(appending: path)
        let data = try Data(contentsOf: url)
        let string = String(bytes: data, encoding: .utf8)
        var components = string?.components(separatedBy: separator) ?? []
        if components.last?.isEmpty ?? false { components.removeLast() }
        return components
    }
    
    public static func listContents(in path: String) throws -> [String] {
        let url = try buildURL(appending: path)
        let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: [])
        return contents.map { $0.lastPathComponent }
    }
    
    private static func buildURL(appending path: String) throws -> URL {
        assert(!_projectName.isEmpty, "FileKeeper.projectName is empty. Did you remember to setup it somewhere?")
        let home = FileManager.default.homeDirectoryForCurrentUser
        let projectFolder = home.appending(path: ".\(_projectName)")
        if !FileManager.default.fileExists(atPath: projectFolder.relativePath) {
            try FileManager.default.createDirectory(at: projectFolder, withIntermediateDirectories: true)
        }
        var components = path.components(separatedBy: "/")
        components.removeLast() // removing file from path components
        try components.indices.forEach { index in
            var folderURL = projectFolder.appending(path: components[0])
            if index != 0 {
                folderURL.append(path: Array(1...index).map { "/\(components[$0])" }.joined())
            }
            if !FileManager.default.fileExists(atPath: folderURL.relativePath) {
                try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: false)
            }
        }
        return projectFolder.appending(path: path)
    }
    
    
}
