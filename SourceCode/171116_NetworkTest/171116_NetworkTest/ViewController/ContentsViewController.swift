
import UIKit

class ContentsViewController: UIViewController {

    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var contentsImgView: UIImageView!
    
    var contents: [String] = []
    var datas: [Data] = []
    var dataItem: Data = Data()
    var imgURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func setupUI() {
        contentsImgView.layer.cornerRadius = contentsImgView.frame.size.width / 2 + 10
        contentsImgView.clipsToBounds = true
        contentsImgView.layer.borderColor = UIColor.lightGray.cgColor
        contentsImgView.layer.borderWidth = 2
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard let currentContents = contentsTextView.text else { return }
        
        if contentsImgView.image != nil {
            let currentUIImage = UIImage(data: dataItem)
            let PostData = PostModel(content: "냉무", title: currentContents, imgCoverUrl: nil)
            
            NetworkManager.shared.requestPosts(post: PostData, img: currentUIImage!, completion: { (isSuccess, resultData, error) in
                if isSuccess {
                    print("성공")
                }else {
                    print(error)
                }
            })
            self.navigationController?.popViewController(animated: true)
            
        }else {

            let currentUIImage = UIImage(data: dataItem)
            let PostData = PostModel(content: currentContents, title: "내용 없음", imgCoverUrl: nil)
            NetworkManager.shared.requestPosts(post: PostData, img: currentUIImage!, completion: { (isSuccess, resultData, error) in
                if isSuccess {
                    print("Post","성공")
                }else {
                    print(error)
                }
            })
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func imagePickerButton(_ sender: UIButton) {
        camera()
    }
    
    
}

extension ContentsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let url = info[UIImagePickerControllerImageURL] as? URL {
            imgURL = UIImagePickerControllerImageURL
            print(url)
            if let data = try? Data(contentsOf: url) {
                dataItem = data
                contentsImgView.image = UIImage(data: data)


            }
            dismiss(animated: true, completion: nil)
        }
    }
    
    func camera() {
        let alertSheet = UIAlertController(title: "사진", message: "사진을 올려주세요", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "찍기", style: .default) { (action) in
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = .camera
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
            }
            alertSheet.addAction(cameraAction)
        }
        
        let photoAction = UIAlertAction(title: "앨범", style: .default) { (action) in
            let photoPicker = UIImagePickerController()
            photoPicker.sourceType = .photoLibrary
            photoPicker.delegate = self
            self.present(photoPicker, animated: true, completion: nil)
        }
        alertSheet.addAction(photoAction)
        alertSheet.addAction(cancelAction)
        present(alertSheet, animated: true, completion: nil)
    }
    
    
    
}
