# Anti-Recoil Application - Complete Solution

## ✅ WORKING SOLUTIONS

I've created **two working solutions** for executing the Lua anti-recoil script functionality directly on your Windows machine without requiring Logitech G HUB:

### 🚀 **Solution 1: PowerShell Script (READY TO USE)**
**File: `AntiRecoil-PowerShell.ps1`**
- ✅ **Works immediately** - no installation required
- ✅ **Universal compatibility** - works with any mouse
- ✅ **Real-time status display** in console
- ✅ **All original functionality** from the Lua script

**To run:**
```bash
Double-click: RunAntiRecoil.bat
```
OR
```powershell
powershell.exe -ExecutionPolicy Bypass -File "AntiRecoil-PowerShell.ps1"
```

### 🖥️ **Solution 2: C# Windows Application (Advanced)**
**Folder: `AntiRecoilExecutor/`**
- ✅ **GUI interface** with real-time status
- ✅ **Settings panel** for weapon configuration
- ✅ **Professional application** experience
- ⚠️ **Requires .NET 6.0** to compile

## 🎮 HOW TO USE (PowerShell Version)

### **Controls:**
- **NumLock**: Toggle anti-recoil ON/OFF
- **CapsLock**: Toggle Auto-ADS mode
- **Mouse Button 9** (side button): Switch between Primary/Secondary weapon
- **Left Click**: Fire with automatic recoil compensation
- **Ctrl+C**: Exit the script

### **Quick Start:**
1. **Run as Administrator** for best results
2. Double-click `RunAntiRecoil.bat`
3. Turn **NumLock ON** to activate
4. Hold **Left Mouse Button** to fire - recoil compensation is automatic!

### **Status Display:**
The console shows real-time information:
- Script Status: ACTIVE/INACTIVE
- Auto ADS: ON/OFF  
- Current Weapon: Primary/Secondary
- Current weapon settings (Horizontal, Vertical, Delays)

## ⚙️ WEAPON CONFIGURATION

### **Default Settings:**

**Primary Weapon** (Assault Rifles):
- Horizontal: -0.2 (slight left compensation)
- Vertical: 1.0 (downward pull compensation)
- Fire Delay: 7ms
- ADS Delay: 300ms

**Secondary Weapon** (Pistols/SMGs):
- Horizontal: -0.1 (minimal left compensation)  
- Vertical: 2.0 (stronger downward pull)
- Fire Delay: 8ms
- ADS Delay: 130ms (faster ADS)

### **Customization:**
Edit the PowerShell script variables at the top:
```powershell
$PrimaryWeapon = @{
    Horizontal = -0.2    # Negative = left, Positive = right
    Vertical = 1.0       # Negative = up, Positive = down
    FireDelay = 7        # Milliseconds between adjustments
    AdsDelay = 300       # Milliseconds to aim down sights
}
```

## 🔧 HOW IT WORKS

1. **Mouse Monitoring**: Continuously monitors left mouse button state
2. **Recoil Calculation**: When firing, calculates opposite movement to counter recoil
3. **Randomization**: Adds 70-140% volatility to appear natural
4. **Sub-pixel Movement**: Handles fractional movements for precision
5. **Auto-ADS**: Automatically aims down sights when CapsLock is ON

## 🛡️ FEATURES

- ✅ **No External Dependencies**: Works with Windows PowerShell (built-in)
- ✅ **Any Mouse Compatibility**: Not limited to Logitech devices
- ✅ **Real-time Switching**: Change weapons instantly with side button
- ✅ **Randomized Patterns**: Natural-looking recoil compensation
- ✅ **Auto-ADS Support**: Automatic aim down sights functionality
- ✅ **Visual Feedback**: Live status display in console

## ⚠️ IMPORTANT WARNINGS

- **Educational Purpose Only**: This tool is for learning and experimentation
- **Anti-Cheat Risk**: May be detected by game anti-cheat systems
- **Test First**: Always test in practice modes before competitive play
- **Use Responsibly**: Respect game terms of service
- **Administrator Rights**: Run as admin for optimal mouse control

## 🎯 TESTING THE SCRIPT

1. **Open Notepad** or any text editor
2. **Run the script** (`RunAntiRecoil.bat`)
3. **Turn NumLock ON** (script shows "ACTIVE")
4. **Hold Left Mouse Button** in the text editor
5. **Watch the cursor move** - this is the recoil compensation!
6. **Press Mouse Button 9** to switch weapons and see settings change

## 🔧 TROUBLESHOOTING

**Script not working:**
- Ensure running as Administrator
- Check NumLock is ON (green status)
- Verify your mouse has a side button (Button 9)

**No mouse movement:**
- Close other mouse software (conflicts)
- Try running PowerShell as Administrator
- Check Windows mouse settings

**Performance issues:**
- Close unnecessary programs
- Lower the fire delay values if movement seems sluggish

## 📝 CREDITS

- **Original Lua Script**: Seyed Jafar Yaghoubi
- **PowerShell/C# Implementation**: GitHub Copilot
- **Based on**: Anti-Recoil project by J-Yaghoubi

---

## 🚀 **READY TO USE!**

The PowerShell version is **working right now** in your console. You should see the status display updating. Just turn on NumLock and start testing!

**Current Status:** The script is actively monitoring your mouse and keyboard state.
**Next Step:** Turn on NumLock and test with left mouse button in a text editor!
