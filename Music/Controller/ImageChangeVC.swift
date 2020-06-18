
import UIKit

class ImageChangeVC: UIViewController {
    
    @IBOutlet weak var MyImage: UIImageView!
    @IBOutlet weak var ImageSD: UISlider!
    @IBOutlet weak var NumLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textView: UITextView!
    
    var index = 0
    let names = ["Image1", "Image2", "Image3", "Image4", "Image5", "Image6", "Image7", "Image8", "Image9", "Image10", "Image11"]
    let textStrings = ["國中時期屁孩頭，\n自以為很時髦嗎？\n該長大了吧？！", "第一次去練團室練團，\n這是我第一把電吉他，\n超中二...", "高中熱音社成發，第一次辦大型演唱會。\n(看起來怎麼有點像伍佰...)", "哇靠！伍佰真的在我吉他上簽名！\n背了一把吉他南下高雄，\n參加飢餓三十活動。", "我的搖滾坐騎 - 野狼150\n我們一起環島、東奔西跑，\n當時在北宜公路被追焦。", "身為音樂製作人的我，\n最具代表性的和平屬性武器也就是吉他。\nGibson Les Paul\n槍與玫瑰-吉他手 Slash 簽名款\n全球限量1200把。", "Shure 55SH 復古式麥克風，\n帶點天然的Overdirve，\n讓我的聲音髒髒的磁性，\n在舞台上充滿魅力！", "銘傳大學106級畢業MV-風的呼喚\n作詞、作曲、編曲、錄音、混音、主唱\n培養自己作為全方位音樂製作人。", "馬祖當兵的日子，\n跨島演出聖誕晚會，\n表演公差不出操之外，\n還可以滑手機，還有榮譽假、獎金。\n", "澳洲打工渡假的日子，\n獲取雪梨街頭藝人證照，\n接家教，音樂教室擔任吉他老師，\n外國薪水可是台灣的四倍呀！", "回台灣囉！這是原本要演出的照片，\n疫情影響只好延期囉～\n這段時間傾盡全力來開發手機App吧！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = textStrings[index]
        let components = DateComponents(calendar: Calendar.current,year: 2010 + index)
        datePicker.date = components.date!
    }
    
    @IBAction func ClickChangeBt(_ sender: Any) {
        
        index += 1
        if index == names.count{
            index = 0
        }
        MyImage.image = UIImage(named: names[index])
        if index == 10 {
            let index = 0
        NumLabel.text = "202\(index)"
        } else {
            NumLabel.text = "201\(index)"
        }
        textView.text = textStrings[index]
        ImageSD.value = Float(index)
        
        
        let components = DateComponents(calendar: Calendar.current,year: 2010 + index)
        datePicker.date = components.date!
        
    }
    
    @IBAction func ImageChangeSD(_ sender: UISlider) {
       
        let index = Int(sender.value.rounded())
        if index == 10 {
            let index = 0
        NumLabel.text = "202\(index)"
        } else {
            NumLabel.text = "201\(index)"
        }
        textView.text = textStrings[index]
        MyImage.image = UIImage(named: names[index])
        
        
        let components = DateComponents(calendar: Calendar.current,year: 2010 + index)
        datePicker.date = components.date!
    }
    

    
    @IBAction func ChangeDate(_ sender: UIDatePicker) {
        
        let year = Calendar.current.component(.year, from: sender.date)
        let index = year - 2010
        MyImage.image = UIImage(named: names[index])
        if index == 10 {
            let index = 0
        NumLabel.text = "202\(index)"
        } else {
            NumLabel.text = "201\(index)"
        }
        textView.text = textStrings[index]
        ImageSD.value = Float(index)
    }
}
