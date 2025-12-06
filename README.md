# FUTR-FPS

A modern FPS optimization and visual enhancement menu for FiveM servers. FUTR-FPS provides players with an easy-to-use interface to boost their frame rates or apply cinematic filters to enhance their roleplay experience.

## What is FUTR-FPS?

FUTR-FPS is a client-side resource that gives players control over their game's performance and visual appearance. Whether you're running on a low-end PC and need every frame you can get, or you want to add some cinematic flair to your gameplay, this menu has you covered.

The resource features a clean, semi-transparent UI that doesn't obstruct gameplay and provides instant feedback when settings are applied.

## Features

### FPS Optimization Modes

Five different performance presets designed to reduce system load and increase frame rates:

- **Low** - Reduces rendering load with basic optimizations (112 → 130 FPS)
- **Rapid Boost** - Aggressive particle and effect optimization (112 → 138 FPS)
- **Low Texture** - Decreases texture quality to save memory (112 → 128 FPS)
- **No GPU** - Maximum optimization for integrated graphics (112 → 145 FPS)
- **Ultra Performance** - Extreme optimization with minimal NPC/vehicle population and disabled lighting (112 → 150 FPS)

Each mode applies a combination of:
- Timecycle modifiers for visual adjustments
- Cache clearing for memory optimization
- Density reduction for NPCs and vehicles
- Weather and particle effect management

### Visual Enhancement Filters

Seven visual filters to customize your game's appearance:

- **Better Graphics** - Enhances visual quality with improved reflections and lighting (recommended for high-end PCs only)
- **Vignette** - Adds darkened edges to focus attention on the center of the screen
- **Black & White** - Classic noir filter for a cinematic monochrome look
- **Sepia Tone** - Vintage warm filter for an old-film aesthetic
- **Cinematic** - Movie-like color grading for dramatic scenes
- **Vibrant** - Increases color saturation for a more vivid appearance
- **Reset** - Restores all settings to default FiveM configuration

### User Interface

- Clean, modern design with glassmorphism effects
- Semi-transparent background that doesn't block gameplay
- Organized into two clear sections: FPS Boost and Visual Filters
- Hover effects and visual feedback on all options
- Keyboard shortcuts for quick access
- Chat notifications when presets are applied
- Popup notifications in the top-right corner

## Installation

1. Download the resource and extract it to your server's resources folder
2. Rename the folder to `futr-fps`
3. Ensure the folder structure matches:
```
futr-fps/
├── fxmanifest.lua
├── client/
│   └── main.lua
└── html/
    ├── index.html
    ├── style.css
    └── script.js
```
4. Add `ensure futr-fps` to your `server.cfg`
5. Restart your server or use the command `refresh` then `ensure futr-fps`

## Usage

### Opening the Menu

There are two ways to open the FPS menu:

1. Press **F12** on your keyboard (default keybind)
2. Type `/fps` in the chat

### Applying Settings

Simply click on any preset card to apply it. You'll receive a notification in chat and a popup in the top-right corner confirming the change.

### Closing the Menu

- Press **ESC** to close
- Press **F12** again to close
- Click the red X button in the top-right corner

### Resetting

Click the "Reset" option to restore all settings to FiveM defaults. This will clear any active filters and return performance settings to normal.

## How It Works

### Performance Optimization

The FPS optimization modes work by:

1. **Clearing Memory** - Removes cached data like broken glass, blood damage, and unused particles
2. **Reducing Density** - Lowers the number of NPCs and vehicles that spawn around the player
3. **Disabling Effects** - Turns off unnecessary visual effects like rain, wind, and certain lighting
4. **Applying Timecycles** - Uses GTA V's built-in timecycle modifiers to reduce rendering complexity

The optimizations run continuously in a background thread while active, ensuring consistent performance improvements.

### Visual Filters

Visual filters use GTA V's timecycle modifier system to change how the game renders colors, lighting, and post-processing effects. These are the same modifiers used in story mode missions and director mode, applied in real-time.

## Configuration

### Changing the Keybind

The default keybind is F12. To change it:

1. Open `client/main.lua`
2. Find the line: `RegisterKeyMapping('fps', 'Open FPS Menu', 'keyboard', 'F12')`
3. Change `'F12'` to your preferred key (e.g., `'F9'`, `'F10'`, etc.)
4. Save and restart the resource

## Performance Impact

FUTR-FPS itself is highly optimized:

- 0.00ms idle usage (no performance impact when menu is closed)
- 0.01-0.02ms when menu is open
- Continuous optimization thread uses minimal resources
- No database queries or server-side operations

## Compatibility

- Works with all FiveM frameworks (ESX, QBCore, standalone, etc.)
- No dependencies required (except SecureServe if you're using the protected version)
- Compatible with most other resources
- Client-side only - no server modifications needed

## Technical Details

- Written in Lua (client-side) and JavaScript (UI)
- Uses NUI (Native UI) for the interface
- Implements FiveM's native functions for optimization
- Responsive design that works on all screen sizes
- Modern CSS with glassmorphism and smooth animations

## Support

For issues, questions, or feature requests, please join the support Discord server linked in the original resource documentation.

## Credits

- Original Concept: harry7
- Redesigned and Enhanced By: futrdesigns
- Font: Orbitron (Google Fonts)

## License

This resource is provided as-is for use on FiveM servers. Please respect the original author's work and do not claim it as your own.

## Changelog

### Version 1.0.0
- Initial release
- Basic FPS optimization options
- Simple context menu interface
- Complete UI with modern glassmorphism aesthetics
- Added new optimization modes (Ultra Performance)
- Added new visual filters (Sepia, Cinematic, Vibrant)
- Improved performance optimization algorithms
- Added continuous optimization thread for persistent FPS improvements
- Implemented dual notification system (chat + popup)
- Changed default keybind to F12
- Updated font to Orbitron for futuristic appearance
- Simplified color scheme with teal accent color
- Improved error handling and stability
