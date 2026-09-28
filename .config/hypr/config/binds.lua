-- ====================================================================
-- macOS Native Ergonomics & Hyprland Hybrid Architecture
-- File: ~/.config/hypr/config/binds.lua
-- Concept: Super = ⌘ (Cmd) | Alt = ⌥ (Option) | Control = ⌃ (Ctrl)
-- ====================================================================

local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- "

-- Khử lỗi bàn phím số (Physical evdev code: 1..9 -> 10..18, 0 -> 19)
local function digitCode(d)
    return "code:" .. (d == 0 and 19 or (9 + d))
end

-- ====================================================================
-- 1. APPLICATION & SYSTEM LIFECYCLE (Chuẩn Apple HIG)
-- ====================================================================

-- Đóng cửa sổ: ⌘ + W (Close Window) & ⌘ + Q (Quit)
hl.bind(mainMod .. " + W",            hl.dsp.window.close())
hl.bind(mainMod .. " + Q",            hl.dsp.window.close())

-- Force Quit (Bắt buộc dừng app treo): ⌘ + ⌥ + Escape
hl.bind(mainMod .. " + ALT + Escape", hl.dsp.exec_cmd("hyprctl kill"))

-- Khóa màn hình: ⌃ + ⌘ + Q
hl.bind(mainMod .. " + CONTROL + Q",  hl.dsp.exec_cmd(noctCall .. "session lock"))

-- Menu Nguồn (Shutdown/Restart): ⌘ + ⌥ + Q
hl.bind(mainMod .. " + ALT + Q",      hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))

-- ====================================================================
-- 2. SPOTLIGHT, SYSTEM HUD & LAUNCHERS
-- ====================================================================

-- Spotlight Search: ⌘ + Space
hl.bind(mainMod .. " + Space",          hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))

-- Emoji & Symbols Picker: ⌃ + ⌘ + Space
hl.bind(mainMod .. " + CONTROL + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))

-- Preferences / Settings: ⌘ + , (Phím tắt kinh điển của mọi app macOS)
hl.bind(mainMod .. " + comma",          hl.dsp.exec_cmd(noctCall .. "settings-toggle"))

-- Notification Center: ⌘ + N
hl.bind(mainMod .. " + N",              hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-- Control Center (Quick Toggles): ⌘ + X
hl.bind(mainMod .. " + X",              hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))

-- Clipboard History: ⌘ + Shift + V
hl.bind(mainMod .. " + SHIFT + V",      hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Terminal: ⌘ + Return
hl.bind(mainMod .. " + Return",         hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + SHIFT + T",         hl.dsp.exec_cmd(launchPrefix .. TERMINAL))

hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))

-- Activity Monitor (Btop): ⌃ + ⇧ + Escape
hl.bind("CONTROL + SHIFT + Escape",     hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))

-- ====================================================================
-- 3. SILENT SCREEN CAPTURE (Chụp câm thẳng vào Clipboard)
-- ====================================================================

-- ⌘ + ⇧ + S : Kéo vùng chọn -> Copy thẳng PNG vào Clipboard (KHÔNG mở cửa sổ edit)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("sh -c 'grim -g \"$(slurp -d)\" - | wl-copy -t image/png && notify-send -t 1500 \"Screenshot\" \"Đã copy vùng chọn vào Clipboard\"'"))

-- ⌘ + ⇧ + 3 : Chụp toàn màn hình -> Copy thẳng vào Clipboard
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.exec_cmd("sh -c 'grim - | wl-copy -t image/png && notify-send -t 1500 \"Screenshot\" \"Đã copy toàn màn hình vào Clipboard\"'"))

-- Phím Print vật lý (dành cho lúc cần mở editor chú thích của Noctalia)
hl.bind("Print",                   hl.dsp.exec_cmd(noctCall .. "screenshot-region"))

-- Color Picker (Chấm màu màn hình): ⌘ + ⇧ + C
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a -n"))

-- ====================================================================
-- 4. WINDOW MANAGEMENT (Lai giữa Tiling và Floating macOS)
-- ====================================================================

-- Chuyển trạng thái cửa sổ Nổi (Floating): ⌘ + ⌥ + Space
hl.bind(mainMod .. " + ALT + Space",  hl.dsp.window.float({ action = "toggle" }))

-- Toàn màn hình (Fullscreen): ⌃ + ⌘ + F
hl.bind(mainMod .. " + CONTROL + F",  hl.dsp.window.fullscreen())

-- Tách đôi màn hình (Toggle Split Orientation): ⌘ + J
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))

-- Đổi Focus giữa các cửa sổ: ⌘ + Mũi tên (hoặc Vim keys H/J/K/L nếu cần)
hl.bind(mainMod .. " + Left",         hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right",        hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up",           hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down",         hl.dsp.focus({ direction = "down" }))

-- Di chuyển vị trí cửa sổ trong Layout: ⌘ + ⌥ + Mũi tên
hl.bind(mainMod .. " + ALT + Left",   hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + ALT + Right",  hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + ALT + Up",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + ALT + Down",   hl.dsp.window.move({ direction = "d" }))

-- App Switcher: ⌘ + Tab (Noctalia switcher) & ⌥ + Tab (Cycle window trực tiếp)
hl.bind(mainMod .. " + Tab",          hl.dsp.exec_cmd(noctCall .. "window-switcher"))
hl.bind("ALT + Tab",                  hl.dsp.window.cycle_next())

-- Thao tác kéo thả cửa sổ tự nhiên bằng chuột:
hl.bind(mainMod .. " + mouse:272",    hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273",    hl.dsp.window.resize())

-- Minimize cửa sổ (Giấu vào Special Workspace): ⌘ + M
hl.bind(mainMod .. " + M",            hl.dsp.window.move({ workspace = "special" }))
-- Mở lại khay ứng dụng đã Minimize: ⌘ + ⇧ + M
hl.bind(mainMod .. " + SHIFT + M",    hl.dsp.workspace.toggle_special())

-- ====================================================================
-- 5. SPACES & MISSION CONTROL (Workspaces)
-- ====================================================================

-- Lướt qua lại giữa các Spaces: ⌃ + Trái / Phải (Chuẩn Trackpad/Keyboard macOS)
hl.bind("CONTROL + Left",             hl.dsp.focus({ workspace = "m-1" }))
hl.bind("CONTROL + Right",            hl.dsp.focus({ workspace = "m+1" }))

-- Mission Control: ⌃ + Lên
hl.bind("CONTROL + Up",               hl.dsp.exec_cmd(noctCall .. "window-switcher"))

-- Quick Empty Space: ⌃ + Xuống
hl.bind("CONTROL + Down",             hl.dsp.focus({ workspace = "emptym" }))

-- Chuyển trực tiếp đến Space 1..9: ⌘ + 1..9
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + " .. digitCode(key), hl.dsp.focus({ workspace = i }))
end

-- Ném cửa sổ sang Space 1..9: ⌘ + ⇧ + 1..9
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. digitCode(key), hl.dsp.window.move({ workspace = i }))
end

-- Lăn chuột đổi Space
hl.bind(mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up",     hl.dsp.focus({ workspace = "m+1" }))

-- ====================================================================
-- 6. HARDWARE & MEDIA CONTROLS
-- ====================================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(noctCall .. "mic-mute"),    { locked = true })

hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media toggle"),      { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"),      { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),        { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"),    { locked = true })

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(noctCall .. "brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })
