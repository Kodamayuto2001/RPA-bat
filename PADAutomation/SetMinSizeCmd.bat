@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms

# powershellで特殊なキー送信ー

Add-Type -Language CSharp -ReferencedAssemblies System.Windows.Forms,System.Drawing -TypeDefinition @'
    public class SendKeysEx
    {
        private const byte VK_LWIN = 0x5B;   // Win Key
        private const byte VK_LEFT = 0x25;   // Left Arrow
	        
        [System.Runtime.InteropServices.DllImport("user32.dll")]
        private static extern uint keybd_event(byte bVk, byte bScan, uint dwFlags, System.IntPtr dwExtraInfo);

        public static void WinLeft()
        {
            // 仮想キーコード
            // http://kts.sakaiweb.com/virtualkeycodes.html
            // https://docs.microsoft.com/ja-jp/windows/win32/inputdev/virtual-key-codes?redirectedfrom=MSDN
            keybd_event(VK_LWIN, 0, 0, (System.IntPtr)0);
            keybd_event(VK_LEFT, 0, 0, (System.IntPtr)0);
            System.Threading.Thread.Sleep(50);
            keybd_event(VK_LEFT, 0, 2/*KEYEVENTF_KEYUP*/, (System.IntPtr)0);
            keybd_event(VK_LWIN, 0, 2/*KEYEVENTF_KEYUP*/, (System.IntPtr)0);
        }
    }
'@

start-sleep -Milliseconds 500
[SendKeysEx]::WinLeft()
