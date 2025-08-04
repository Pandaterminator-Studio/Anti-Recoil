# Anti-Recoil Script Executor

A Windows application that executes the anti-recoil functionality directly, without requiring Logitech G HUB or any specific mouse brand.

## Features

- **Universal Compatibility**: Works with any mouse, not just Logitech devices
- **Direct Execution**: No need for Logitech G HUB or additional software
- **Real-time Status**: Live monitoring of script status and current weapon
- **Configurable Settings**: Easy-to-use interface for weapon configuration
- **Two Weapon Profiles**: Primary and secondary weapon configurations
- **Auto-ADS Support**: Automatic aim down sights functionality

## Requirements

- Windows 10/11
- .NET 6.0 Runtime or SDK
- Any gaming mouse (USB or wireless)

## Installation

1. Install .NET 6.0 Runtime from Microsoft's website if not already installed
2. Extract all files to a folder on your computer
3. Run `BuildAndRun.bat` to compile and start the application

## Usage

### Controls
- **NumLock**: Toggle the anti-recoil script ON/OFF
- **CapsLock**: Toggle Auto-ADS mode ON/OFF
- **Mouse Button 9** (side button): Switch between weapon profiles
- **Left Mouse Button**: Fire with recoil compensation (when script is active)
- **Right Mouse Button**: Manual ADS

### Getting Started
1. Launch the application using `BuildAndRun.bat`
2. Click "Settings" to configure weapon parameters for your games
3. Turn ON NumLock to activate the script
4. Hold left mouse button to fire - the script will automatically compensate for recoil
5. Use Mouse Button 9 to switch between primary and secondary weapon profiles

### Configuration

#### Weapon Settings
- **Horizontal**: Left/Right recoil compensation (negative = left, positive = right)
- **Vertical**: Up/Down recoil compensation (negative = up, positive = down)
- **Fire Delay**: Time between recoil adjustments in milliseconds
- **ADS Delay**: Time required to aim down sights in milliseconds

#### Default Settings
**Primary Weapon** (Assault Rifles):
- Horizontal: -0.2
- Vertical: 1.0
- Fire Delay: 7ms
- ADS Delay: 300ms

**Secondary Weapon** (Pistols/SMGs):
- Horizontal: -0.1
- Vertical: 2.0
- Fire Delay: 8ms
- ADS Delay: 130ms

## How It Works

The application monitors your mouse input and applies calculated movements to counter weapon recoil patterns. When you fire (hold left mouse button) with the script active (NumLock ON), it automatically moves your mouse in the opposite direction of the recoil.

### Randomization
Like the original Lua script, this application includes randomization factors to make the recoil compensation appear more natural and harder to detect by anti-cheat systems.

### Auto-ADS Mode
When CapsLock is ON, the script will automatically engage ADS (right mouse button) when you start firing, then release it when you stop.

## Important Notes

⚠️ **WARNING**: This tool is for educational purposes only. Use at your own risk and responsibility.

- May be detected by anti-cheat systems in online games
- Test settings in practice modes before using in competitive play
- Different games may require different configuration values
- The script only works when NumLock is enabled

## Troubleshooting

**Script not working:**
- Ensure NumLock is ON (green status in the application)
- Check that your mouse has a side button (Button 9) for weapon switching
- Try adjusting the weapon settings if recoil compensation seems ineffective

**Build errors:**
- Install .NET 6.0 SDK from Microsoft
- Run the batch file as administrator if needed

**Mouse not responding:**
- Close other mouse software that might conflict
- Restart the application
- Check Windows mouse settings

## Legal Disclaimer

This software is provided for educational and research purposes only. The authors are not responsible for any misuse or consequences resulting from the use of this tool. Users are advised to respect the terms of service of any games or applications they use this with.

## Credits

Original Lua script by: Seyed Jafar Yaghoubi
C# Application adaptation: GitHub Copilot

## Support

For issues or questions, please refer to the original repository or create an issue on GitHub.
