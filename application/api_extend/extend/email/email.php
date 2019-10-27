<?php
/**
 *  邮件系统
 **/

require_once "extend/email/PHPMailer.php";
require_once "extend/email/SMTP.php";

class email
{
    // 配置参数
    private $host       = '';
    private $username   = '';
    private $password   = '';
    private $port       = '';
    private $from_email = '';

    // 邮件标题
    public $subject = '';

    // 邮件内容
    public $body = '';

    // 发件人昵称
    public $from_nickname = '';

    /**
     * 收件方的地址与昵称
     * eg.$to =  [['to_email' => 收件方邮箱1, 'to_nickname' => 收件方昵称1],['to_email' => 收件方邮箱2, 'to_nickname' => 收件方昵称2],……]
     */
    public $to   = [];

    /**
     * 抄送方的地址与昵称
     * eg.$cc =  [['cc_email' => 抄送方邮箱1, 'cc_nickname' => 抄送方昵称1],['cc_email' => 抄送方邮箱2, 'cc_nickname' => 抄送方昵称2],……]
     */
    public $cc   = [];

    /**
     * 密送方的地址与昵称
     * eg.$bcc =  [['bcc_email' => 密送方邮箱1, 'bcc_nickname' => 密送方昵称1],['bcc_email' => 密送方邮箱2, 'bcc_nickname' => 密送方昵称2],……]
     */
    public $bcc  = [];

    /**
     * 附件的路径与名称
     * eg.$file =  [['file_path' => 附件路径1, 'file_name' => 附件名称1],['file_path' => 附件路径2, 'file_name' => 附件名称2],……]
     */
    public $file = [];

    /**
     * 【email】初始化参数
     */
    public function __construct()
    {
        $data  = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $email = $data['email'];

        $this->host       = $email['host'];
        $this->username   = $email['username'];
        $this->password   = $email['password'];
        $this->port       = $email['port'];
        $this->from_email = $email['from_email'];
    }

    /**
     * 【email】获取发信人邮件地址
     */
    public function get_from_email()
    {
        return $this->from_email;
    }

    /**
     * 【email】发送邮件
     */
    public function send()
    {
        date_default_timezone_set('Asia/Shanghai'); //设定时区东八区

        $mail            = new PHPMailer;
        $mail->SMTPDebug = 2;

        $mail->isSMTP();
        $mail->Host       = $this->host; // Specify main and backup SMTP servers
        $mail->SMTPAuth   = true; // Enable SMTP authentication
        $mail->Username   = $this->username; // SMTP username
        $mail->Password   = $this->password; // SMTP password dvomgmdozqgaecij'
        $mail->SMTPSecure = 'ssl'; // Enable TLS encryption, `ssl` also accepted
        $mail->Port       = $this->port;

        // 发件方的地址与昵称(发送方邮箱可看到)
        $mail->setFrom($this->from_email, $this->from_nickname);

        // 收件方的地址与昵称（发送方邮箱可看到）
        foreach ($this->to as $key => $value) {
            $mail->addAddress($value['to_email'], $value['to_nickname']);
        }

        // 抄送方的地址与昵称
        foreach ($this->cc as $key => $value) {
            $mail->addCC($value['cc_email'], $value['cc_nickname']);
        }

        // 密送方的地址与昵称
        foreach ($this->bcc as $key => $value) {
            $mail->addBCC($value['bcc_email'], $value['bcc_nickname']);
        }

        // 附件的路径与名称
        foreach ($this->file as $key => $value) {
            $mail->addAttachment($value['file_path'], $value['file_name']);
        }

        $mail->isHTML(true); // Set email format to HTML

        $mail->Subject = $this->subject;
        $mail->Body    = $this->body;

        if ($mail->send()) {
            return ['code' => 1, 'msg' => '发送成功'];
        } else {
            return ['code' => 0, 'msg' => $mail->ErrorInfo];
        }
    }
}
