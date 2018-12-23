
import Foundation
import Alamofire
import MobileCoreServices
import UIKit

var backgroundManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.background(withIdentifier: "com.bb.background"))


class MediaUploader {
    func uploadMediaFromURL(mediaUrl: URL, cb: @escaping (String?) -> Void) {

        guard let imageData = try? Data(contentsOf: mediaUrl), let image = UIImage(data: imageData), let data = image.jpegData(compressionQuality: 0.5) else {
            cb(nil)
            Log("no image found at local url", type: .error)
            return
        }

        guard let token = CurrentUser.getToken() else {
            Log("no user token", type: .error)
            cb(nil)
            return
        }
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)",
            "Content-Type": "multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(data, withName: "imageData")
        },
            to: serverURL.appendingPathComponent("image"),
            method: .post,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in

                        if let json = response.result.value as? [String: String],
                            let imageURL = json["url"] {
                            cb(imageURL)
                        } else {
                            Log("bad response format", type: .error)
                            cb(nil)
                        }
                    }
                case .failure(let encodingError):
                    Log("\(encodingError)", type: .error)
                     cb(nil)
                }
        })
    }
    
    private class func mimeType(forPathExtension pathExtension: String) -> String {
        if
            let id = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as CFString, nil)?.takeRetainedValue(),
            let contentType = UTTypeCopyPreferredTagWithClass(id, kUTTagClassMIMEType)?.takeRetainedValue()
        {
            return contentType as String
        }
        
        return "application/octet-stream"
    }
    
    private class func removeTempImageFrom(path: URL?) {
        if let path = path {
            do {
                try FileManager.default.removeItem(at: path)
            } catch(let error) {
                Log("\(error.localizedDescription)", type: .error)
            }
        }
    }
    
    
}
