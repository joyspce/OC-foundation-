#import "ViewController.h"

// 这就是类扩展 (extension)
// 将所有线都拖到类扩展里，保证程序的封装性。
@interface ViewController ()
// 第一个 TextField
@property (weak, nonatomic) IBOutlet UITextField *txtNum1;
// 第二个 TextField
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;
// 结果的 Label
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
// 计算按钮的方法的声明 IBAction 相当于 void 。但是由于他要与按钮触发时间连接，所以前面不能写 void 。
- (IBAction)touchToCalc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 计算方法的实现
- (IBAction)touchToCalc {
    // 记录 num1 和 num2 的数据（注意：刚开始接受的数据是 NSString 类型的数据，所以在转换成 int 型的时候用 intValue 方法）
    int num1 = self.txtNum1.text.intValue;
    int num2 = self.txtNum2.text.intValue;
    // 将结果的数据传给结果的 Label 。即 lblResult 。接受值的 label 不要忘了调用 text 方法。
    // 注意：传回去的值是 NSString 型的数据。需要调用 stringWithFormat 的类方法。
    self.lblResult.text = [NSString stringWithFormat:@"%d", num1 + num2];
    // 关闭键盘
    /*
     第一种方法：将这个 view endEditing。
     第二种方法：第一响应者 resignFirstResponder
     */
    // 第一种方法，简单粗暴，在 textField 多的地方使用特别好。
    [self.view endEditing:YES];
    // 第二种方法 各个控制，注意：控制的是活跃的文本框，不是整个 view 。
//    [self.txtNum1 resignFirstResponder];
//    [self.txtNum2 resignFirstResponder];
}

@end
